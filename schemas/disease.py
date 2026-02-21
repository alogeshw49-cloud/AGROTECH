from pydantic import BaseModel
from typing import Optional
from datetime import datetime
from uuid import UUID

class DiseaseBase(BaseModel):
    crop_name: str
    disease_name: str
    description: Optional[str] = None
    symptoms: Optional[str] = None
    remedy: Optional[str] = None
    organic_remedy: Optional[str] = None
    prevention: Optional[str] = None
    severity_notes: Optional[str] = None
    language: str = "en"

class DiseaseCreate(DiseaseBase):
    pass

class DiseaseUpdate(DiseaseBase):
    crop_name: Optional[str] = None
    disease_name: Optional[str] = None

class DiseaseResponse(DiseaseBase):
    id: UUID
    last_updated: datetime

    class Config:
        from_attributes = True
