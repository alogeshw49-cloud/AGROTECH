from pydantic import BaseModel
from typing import Optional, Dict, Any
from datetime import datetime
from uuid import UUID

class ScanHistoryResponse(BaseModel):
    id: UUID
    user_id: UUID
    image_url: str
    crop_name: Optional[str]
    disease_name: Optional[str]
    confidence: Optional[float]
    severity: Optional[str]
    advice: Optional[str]
    location: Optional[Dict[str, Any]]
    weather_data: Optional[Dict[str, Any]]
    model_version: Optional[str]
    created_at: datetime
    
    class Config:
        from_attributes = True
