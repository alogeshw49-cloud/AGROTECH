import uuid
from sqlalchemy import Column, String, Text, DateTime, func, Index
from sqlalchemy.dialects.postgresql import UUID
from core.database import Base

class Disease(Base):
    __tablename__ = "diseases"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    crop_name = Column(String, index=True, nullable=False)
    disease_name = Column(String, index=True, nullable=False)
    description = Column(Text, nullable=True)
    symptoms = Column(Text, nullable=True)
    remedy = Column(Text, nullable=True)
    organic_remedy = Column(Text, nullable=True)
    prevention = Column(Text, nullable=True)
    severity_notes = Column(Text, nullable=True)
    language = Column(String, default="en", index=True, nullable=False)
    
    last_updated = Column(DateTime(timezone=True), server_default=func.now(), onupdate=func.now(), nullable=False)

    __table_args__ = (
        Index('ix_disease_crop_name_lang', 'crop_name', 'disease_name', 'language', unique=True),
    )
