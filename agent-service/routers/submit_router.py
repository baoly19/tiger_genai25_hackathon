"""
Router for handling submit requests.
"""

from typing import Union
from datetime import datetime

from fastapi import APIRouter, File, Form, UploadFile, HTTPException

from schemas.request_schemas import SubmitResponse, ErrorResponse
from services.agent_service import AgentService
from config import settings

router = APIRouter()
agent_service = AgentService()


@router.post("/submit", response_model=Union[SubmitResponse, ErrorResponse])
async def submit_request(
    f_data: UploadFile = File(...),
    p_data: str = Form(...),
    f_type: str = Form(...),
    ai_report_id: str = Form(...)  # Now required since we query the database
):
    """
    Complete AI workflow endpoint:
    1. Query ai_reports table in Supabase using ai_report_id
    2. Get JWT token from GenAI backend
    3. Upload file to GenAI backend → get file_id 
    4. Inject file_id into system prompt
    5. Connect to WebSocket and send message with file reference
    6. Wait for AI response via WebSocket
    7. Update ai_reports content in Supabase with AI response
    8. Return structured JSON response with ai_report_id and report_content
    
    Args:
        f_data: File binary data (image, document, etc.)
        p_data: User prompt text for AI analysis
        f_type: File type ("image", "text", "document")
        ai_report_id: AI report ID (must exist in ai_reports table)
    
    Returns:
        SubmitResponse: {
            "ai_report_id": "uuid",
            "report_content": "AI analysis content"
        }
        
        OR ErrorResponse on failure: {
            "ai_report_id": "uuid or null",
            "report_content": "",
            "error": "error message"
        }
    """
    # Use default session ID
    session_id = settings.DEFAULT_SESSION_ID
    
    try:
        # Read file content
        file_content = await f_data.read()
        filename = f_data.filename or "uploaded_file"
        
        print(f"🚀 Processing request:")
        print(f"   File: {filename} ({f_type})")
        print(f"   User prompt: {p_data}")
        print(f"   Session ID: {session_id}")
        print(f"   AI Report ID: {ai_report_id}")
        
        # Execute complete workflow with file type context
        result = await agent_service.process_complete_workflow(
            file_content=file_content,
            filename=filename,
            user_data=p_data,
            session_id=session_id,
            ai_report_id=ai_report_id,
            file_type=f_type
        )
        
        # Return appropriate response based on success
        if result.get('success'):
            return SubmitResponse(
                ai_report_id=result['ai_report_id'],
                report_content=result['content']
            )
        else:
            return ErrorResponse(
                ai_report_id=result.get('ai_report_id'),
                report_content="",
                error=result.get('error', 'Unknown error occurred')
            )
        
    except Exception as e:
        error_msg = str(e)
        print(f"❌ Submit endpoint error: {error_msg}")
        
        return ErrorResponse(
            ai_report_id=ai_report_id,
            report_content="",
            error=error_msg
        ) 