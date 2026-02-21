from typing import Any, List, Optional
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select

from core.database import get_db
from models.user import User
from models.disease import Disease
from schemas.disease import DiseaseCreate, DiseaseUpdate, DiseaseResponse
from api.deps import get_current_active_admin, get_current_user

router = APIRouter()

@router.get("/", response_model=List[DiseaseResponse])
async def read_diseases(
    crop: Optional[str] = None,
    disease: Optional[str] = None,
    language: str = "en",
    skip: int = 0,
    limit: int = 100,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user)
) -> Any:
    """Retrieve diseases list with optional filters."""
    query = select(Disease).filter(Disease.language == language)
    
    if crop:
        query = query.filter(Disease.crop_name.ilike(f"%{crop}%"))
    if disease:
        query = query.filter(Disease.disease_name.ilike(f"%{disease}%"))
        
    query = query.offset(skip).limit(limit)
    result = await db.execute(query)
    
    return result.scalars().all()

@router.post("/", response_model=DiseaseResponse)
async def create_disease(
    *,
    db: AsyncSession = Depends(get_db),
    disease_in: DiseaseCreate,
    current_admin: User = Depends(get_current_active_admin)
) -> Any:
    """Create a new disease entry (Admin only)."""
    # Check if duplicate
    stmt = select(Disease).filter(
        Disease.crop_name == disease_in.crop_name,
        Disease.disease_name == disease_in.disease_name,
        Disease.language == disease_in.language
    )
    result = await db.execute(stmt)
    if result.scalars().first():
        raise HTTPException(status_code=400, detail="Disease entry already exists for this language.")
        
    disease = Disease(**disease_in.model_dump())
    db.add(disease)
    await db.commit()
    await db.refresh(disease)
    return disease
