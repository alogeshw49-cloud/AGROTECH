from typing import Any, List
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select

from core.database import get_db
from models.user import User
from models.scan_history import ScanHistory
from schemas.history import ScanHistoryResponse
from api.deps import get_current_user

router = APIRouter()

@router.get("/", response_model=List[ScanHistoryResponse])
async def read_user_scan_history(
    skip: int = Query(0, ge=0),
    limit: int = Query(20, le=100),
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user)
) -> Any:
    """Retrieve your own scan history logs."""
    query = select(ScanHistory)\
        .filter(ScanHistory.user_id == current_user.id)\
        .filter(ScanHistory.deleted_at == None)\
        .order_by(ScanHistory.created_at.desc())\
        .offset(skip).limit(limit)
        
    result = await db.execute(query)
    scans = result.scalars().all()
    
    return scans

@router.get("/{scan_id}", response_model=ScanHistoryResponse)
async def read_scan_history_item(
    scan_id: str,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user)
) -> Any:
    """Get single scan metadata securely."""
    query = select(ScanHistory).filter(
        ScanHistory.id == scan_id, 
        ScanHistory.user_id == current_user.id,
        ScanHistory.deleted_at == None
    )
    result = await db.execute(query)
    scan = result.scalars().first()
    
    if not scan:
        raise HTTPException(status_code=404, detail="Scan record not found or accessible")
        
    return scan
