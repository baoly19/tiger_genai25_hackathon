"""
FastAPI application for AgentOS service.
"""

# Note: Environment variables should be set manually or sourced from .env

import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from routers import submit_router
from config import settings

app = FastAPI(
    title="AgentOS Service",
    description="Service for handling agent requests and file processing",
    version="1.0.0",
    debug=settings.DEBUG
)

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Configure this properly for production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(submit_router.router, prefix="/api/v1")

@app.get("/")
async def root():
    """Root endpoint."""
    return {"message": "AgentOS Service is running"}

@app.get("/health")
async def health_check():
    """Health check endpoint."""
    return {"status": "healthy", "service": "AgentOS Service"}

if __name__ == "__main__":
    uvicorn.run(
        "main:app",
        host=settings.HOST,
        port=settings.PORT,
        reload=settings.DEBUG
    ) 