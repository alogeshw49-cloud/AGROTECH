import uuid
from sqlalchemy import Column, String, Float, DateTime, func, ForeignKey, Text
from sqlalchemy.dialects.postgresql import UUID, JSON
from sqlalchemy.orm import relationship
from core.database import Base

class ScanHistory(Base):
    __tablename__ = "scan_history"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), index=True, nullable=False)
    image_url = Column(String, nullable=False)
    crop_name = Column(String, index=True, nullable=True)
    disease_name = Column(String, index=True, nullable=True)
    confidence = Column(Float, nullable=True)
    severity = Column(String, nullable=True)
    advice = Column(Text, nullable=True)
    location = Column(JSON, nullable=True)
    weather_data = Column(JSON, nullable=True)
    model_version = Column(String, nullable=True)
    
    created_at = Column(DateTime(timezone=True), server_default=func.now(), index=True, nullable=False)
    deleted_at = Column(DateTime(timezone=True), nullable=True)
    
    user = relationship("User")
