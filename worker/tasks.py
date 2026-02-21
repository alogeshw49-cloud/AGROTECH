import base64
from worker.celery_app import celery_app
from services.inference import model_instance
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine
from core.config import settings

# For synchronous DB access in Celery, we might need a sync engine:
# Using async in celery requires specific async loops, standard approach is sync DB.
sync_db_uri = str(settings.SQLALCHEMY_DATABASE_URI).replace("+asyncpg", "")
engine = create_engine(sync_db_uri)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

@celery_app.task(name="worker.tasks.process_image_upload")
def process_image_upload(image_base64: str, user_id: str, location: str = None):
    """
    Background task to process an uploaded image.
    1. Decode image
    2. Run inference
    3. Save result to scan_history
    """
    image_bytes = base64.b64decode(image_base64)
    # Note: Inference runs directly here since celery workers handle blocking tasks
    result = model_instance.predict(image_bytes)
    
    # Store result to ScanHistory sync DB connection (pseudo code for now)
    # with SessionLocal() as db:
    #     new_history = ScanHistory(user_id=user_id, ..., ) 
    #     db.add(new_history)
    #     db.commit()

    return result
