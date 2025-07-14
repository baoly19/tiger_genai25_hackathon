#!/usr/bin/env python3
"""
Simple script to run the AgentOS FastAPI service.
"""

# Note: Environment variables should be set manually or sourced from .env

import uvicorn
from config import settings

if __name__ == "__main__":
    print("🚀 Starting AgentOS FastAPI Service")
    print(f"📍 Server will run on http://{settings.HOST}:{settings.PORT}")
    print(f"📝 API docs will be available at http://{settings.HOST}:{settings.PORT}/docs")
    print("=" * 60)
    
    uvicorn.run(
        "main:app",
        host=settings.HOST,
        port=settings.PORT,
        reload=settings.DEBUG,
        log_level="info"
    ) 