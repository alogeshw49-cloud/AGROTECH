import pytest
import pytest_asyncio
import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from httpx import AsyncClient, ASGITransport
from main import app
from core.database import get_db

# Mock DB session dependency
async def override_get_db():
    class DummySession:
        async def execute(self, *args, **kwargs):
            class DummyResult:
                def scalars(self):
                    class DummyScalars:
                        def first(self): return None
                        def all(self): return []
                    return DummyScalars()
            return DummyResult()
        
        def add(self, model_instance, *args, **kwargs): 
            # Mock the missing DB auto-generated fields
            import uuid
            from datetime import datetime, timezone
            model_instance.id = uuid.uuid4()
            model_instance.is_active = True
            model_instance.role = "user"
            model_instance.created_at = datetime.now(timezone.utc)
        
        async def commit(self): pass
        async def refresh(self, *args, **kwargs): pass
            
    yield DummySession()

app.dependency_overrides[get_db] = override_get_db

@pytest_asyncio.fixture()
async def async_client():
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as client:
        yield client
