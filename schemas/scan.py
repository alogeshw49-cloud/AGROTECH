import pydantic
from pydantic import BaseModel
from typing import Optional, Dict, Any

class ScanUploadResponse(BaseModel):
    message: str
    scan_id: str
    task_id: str

class ScanResult(BaseModel):
    crop_name: str
    disease_name: str
    confidence: float
    severity: str
    model_version: str
