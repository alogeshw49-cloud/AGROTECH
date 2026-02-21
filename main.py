from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from api.v1.api import api_router
from core.config import settings

app = FastAPI(
    title="AgroDetect AI API",
    version="1.0.0",
    description="Plant disease detection backend API"
)

# CORS configuration (important for Flutter frontend)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include all API routes
app.include_router(api_router)


@app.get("/")
def root():
    return {"message": "AgroDetect API Running"}
