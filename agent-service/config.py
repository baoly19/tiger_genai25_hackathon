"""
Configuration settings for AgentOS service.
"""

import os
from typing import Optional
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()


class Settings:
    """Application settings."""

    # Server configuration
    HOST: str = os.getenv("HOST", "0.0.0.0")
    PORT: int = int(os.getenv("PORT", "8001"))
    DEBUG: bool = os.getenv("DEBUG", "true").lower() == "true"

    # AgentOS configuration
    AGENTOS_API_URL: str = os.getenv("AGENTOS_API_URL", "http://localhost:8000")
    AGENTOS_WS_URL: str = os.getenv("AGENTOS_WS_URL", "ws://localhost:8000")

    # Authentication - JWT tokens are now generated dynamically from username/password
    AGENTOS_USERNAME: str = os.getenv("AGENTOS_USERNAME", "your_username")
    AGENTOS_PASSWORD: str = os.getenv("AGENTOS_PASSWORD", "your_password")
    AGENTOS_API_KEY: str = os.getenv("AGENTOS_API_KEY", "e1adc3d8-fca1-40b2-b90a-7b48290f2d6a::master_server_ml")

    # File handling
    UPLOAD_DIR: str = os.getenv("UPLOAD_DIR", "uploads")
    MAX_FILE_SIZE: int = int(os.getenv("MAX_FILE_SIZE", str(10 * 1024 * 1024)))  # 10MB
    ALLOWED_EXTENSIONS: set = {
        # Images
        "jpg", "jpeg", "png", "gif", "bmp", "webp", "svg",
        # Documents
        "pdf", "doc", "docx", "txt", "rtf", "odt",
        # Text files
        "txt", "md", "csv", "json", "xml", "yaml", "yml"
    }

    # Processing
    PROCESSING_TIMEOUT: int = int(os.getenv("PROCESSING_TIMEOUT", "30"))  # seconds
    MAX_CONCURRENT_PROCESSES: int = int(os.getenv("MAX_CONCURRENT_PROCESSES", "5"))

    # Agent configuration
    TARGET_AGENT_UUID: str = os.getenv("TARGET_AGENT_UUID", "master_server_ml")  # UUID of the agent to send messages to

    # Fixed UUIDs for consistent file upload (matching your existing setup)
    DEFAULT_REQUEST_ID: str = "3fa85f64-5717-4562-b3fc-2c963f66afa6"
    DEFAULT_SESSION_ID: str = "3fa85f64-5717-4562-b3fc-2c963f66afa6"

    # Supabase configuration
    SUPABASE_URL: str = os.getenv("SUPABASE_URL", "")
    SUPABASE_ANON_KEY: str = os.getenv("SUPABASE_ANON_KEY", "")

    # Simplified system prompt template with essential context including patient data

    PDF_SYSTEM_PROMPT_TEMPLATE: str = """Please analyze this patient's information, read the labtest with ocr. With all of the details gathered, suggest likely diagnoses, search insights from relevant publications in PubMed, and recommend a final treatment plan.

Patient Information:
{patient_data}
## File Information
- **File ID**: {file_id}
- **Filename**: {filename}
- **File Type**: {file_type}

"""
    SYSTEM_PROMPT_TEMPLATE: str = """Please analyze this patient's information, upload the chest X-ray to MCP, then use MCP to analyze the image. With all of the details gathered, suggest likely diagnoses, search insights from relevant publications in PubMed, and recommend a final treatment plan.

Patient Information:
{patient_data}
## File Information
- **File ID**: {file_id}
- **Filename**: {filename}
- **File Type**: {file_type}

"""

    # Simplified prompt template - just the system prompt with patient data included
    ENHANCED_PROMPT_TEMPLATE: str = """{system_prompt}

---
**Analysis:**"""

    @staticmethod
    def get_type_specific_capabilities(file_type: str) -> str:
        """Generate specialized capabilities text based on file type."""
        # Simplified capabilities - this method is no longer used in the simplified template
        # but keeping it for backward compatibility
        return f"Specialized analysis for {file_type} files"


# Create settings instance
settings = Settings() 
