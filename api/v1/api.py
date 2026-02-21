from fastapi import APIRouter

# Import route modules
from api.v1 import auth
from api.v1 import diseases
from api.v1 import scan
from api.v1 import history
from api.v1 import admin

# Main API router with version prefix
api_router = APIRouter(prefix="/api/v1")

# Include sub-routers
api_router.include_router(
    auth.router,
    prefix="/auth",
    tags=["Authentication"]
)

api_router.include_router(
    diseases.router,
    prefix="/diseases",
    tags=["Diseases"]
)

api_router.include_router(
    scan.router,
    prefix="/scan",
    tags=["Scanning"]
)

api_router.include_router(
    history.router,
    prefix="/history",
    tags=["History"]
)

api_router.include_router(
    admin.router,
    prefix="/admin",
    tags=["Admin Panel"]
)
