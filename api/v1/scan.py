import uuid
import base64
import os
from typing import Any, Optional
from fastapi import APIRouter, Depends, File, UploadFile, Form, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession

from core.database import get_db
from models.user import User
from schemas.scan import ScanUploadResponse
from api.deps import get_current_user
from worker.tasks import process_image_upload

router = APIRouter()

# Simple temp dir config
TEMP_UPLOAD_DIR = "/tmp/agrodetect_uploads"
os.makedirs(TEMP_UPLOAD_DIR, exist_ok=True)

@router.post("/", response_model=ScanUploadResponse)
async def upload_scan_image(
    image: UploadFile = File(...),
    location: Optional[str] = Form(None),
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user)
) -> Any:
    """
    Upload an image for plant disease scanning.
    """
    # 1. Validation
    allowed_types = ["image/jpeg", "image/png", "image/webp"]
    if image.content_type not in allowed_types:
        raise HTTPException(status_code=400, detail="Only JPEG, PNG, and WEBP images are allowed.")
    
    # 2. Reading
    image_bytes = await image.read()
    if len(image_bytes) > 10 * 1024 * 1024:
        raise HTTPException(status_code=400, detail="Image size exceeds 10 MB limit.")

    # 3. Save Temporarily
    new_filename = f"{uuid.uuid4()}_{image.filename}"
    file_path = os.path.join(TEMP_UPLOAD_DIR, new_filename)
    with open(file_path, "wb") as f:
        f.write(image_bytes)

    # 4. Offload to background task via Celery
    b64_img = base64.b64encode(image_bytes).decode('utf-8')
    task = process_image_upload.delay(b64_img, str(current_user.id), location)
    
    return {
        "message": "Image uploaded successfully and queued for processing.",
        "scan_id": new_filename,
        "task_id": task.id
    }
