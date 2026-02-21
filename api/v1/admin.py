from typing import Any
from fastapi import APIRouter, Depends, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select
from sqlalchemy import func

from core.database import get_db
from models.user import User
from models.scan_history import ScanHistory
from api.deps import get_current_active_admin

router = APIRouter()

@router.get("/analytics/scans")
async def get_scan_analytics(
    db: AsyncSession = Depends(get_db),
    current_admin: User = Depends(get_current_active_admin)
) -> Any:
    """Get system-wide scan analytics."""
    # Example: Count total scans
    stmt = select(func.count(ScanHistory.id))
    result = await db.execute(stmt)
    total_scans = result.scalar_one()

    # Get grouping by disease
    stmt_d = select(ScanHistory.disease_name, func.count(ScanHistory.id))\
        .group_by(ScanHistory.disease_name)
    result_d = await db.execute(stmt_d)
    disease_distribution = {row[0] or "unknown": row[1] for row in result_d.all()}
    
    return {
        "total_scans": total_scans,
        "disease_distribution": disease_distribution
    }

@router.get("/analytics/users")
async def get_user_analytics(
    db: AsyncSession = Depends(get_db),
    current_admin: User = Depends(get_current_active_admin)
) -> Any:
    """Get system-wide user metrics."""
    stmt = select(func.count(User.id))
    result = await db.execute(stmt)
    total_users = result.scalar_one()
    
    return {
        "total_users": total_users,
    }
