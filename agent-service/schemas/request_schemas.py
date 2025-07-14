"""
Request schemas for the AgentOS service.
"""

from pydantic import BaseModel
from typing import Optional
from datetime import datetime
from fastapi import UploadFile


class SubmitRequest(BaseModel):
    """Schema for submit request data."""
    p_data: str
    f_type: str
    ai_report_id: str  # Required - must exist in Supabase
    
    class Config:
        schema_extra = {
            "example": {
                "p_data": "Please analyze this medical image",
                "f_type": "image",
                "ai_report_id": "123e4567-e89b-12d3-a456-426614174000"
            }
        }


class SubmitResponse(BaseModel):
    """Schema for submit response with AI report data."""
    ai_report_id: str
    report_content: str
    
    class Config:
        schema_extra = {
            "example": {
                "ai_report_id": "123e4567-e89b-12d3-a456-426614174000",
                "report_content": "# Medical Image Analysis\n\nThe image shows..."
            }
        }


class ErrorResponse(BaseModel):
    """Schema for error response."""
    ai_report_id: Optional[str] = None
    report_content: str = ""
    error: str
    
    class Config:
        schema_extra = {
            "example": {
                "ai_report_id": None,
                "report_content": "",
                "error": "Failed to process file"
            }
        } 