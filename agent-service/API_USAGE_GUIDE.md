# Agent Service API Usage Guide

## Overview

The Agent Service provides a `/submit` endpoint that processes files using AI agents and returns structured responses. The system prompt is hardcoded in configuration and automatically includes file_id injection for enhanced analysis.

## Features

### Response Format
The API returns a simplified response format:
```json
{
  "ai_report_id": "string",
  "report_content": "string"
}
```

### Hardcoded System Prompt with File ID Injection
The AI agent uses a predefined system prompt template that automatically injects the uploaded file's ID. This allows the AI to reference the specific file in its analysis.

### Supabase Integration
The service now integrates with Supabase to:
- Verify that the `ai_report_id` exists before processing
- Update existing records with AI-generated content
- Uses the official Supabase Python client for reliable database operations

## API Endpoint

### POST `/api/v1/submit`

Processes a file using AI agents and updates an existing Supabase record with the analysis.

#### Request Format (multipart/form-data)

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `f_data` | File | Yes | The file to be analyzed |
| `p_data` | Text | Yes | User prompt/question about the file |
| `f_type` | Text | Yes | File type (e.g., "image", "text", "document") |
| `ai_report_id` | Text | **Yes** | AI report ID that must exist in Supabase `ai_reports` table |

#### Response Format

**Success Response:**
```json
{
  "ai_report_id": "123e4567-e89b-12d3-a456-426614174000",
  "report_content": "# Analysis Results\n\nAnalyzing file ID: file_12345\n\nThe file contains..."
}
```

**Error Response:**
```json
{
  "ai_report_id": "123e4567-e89b-12d3-a456-426614174000",
  "report_content": "",
  "error": "AI report with ID 123e4567-e89b-12d3-a456-426614174000 not found in database"
}
```

## Example Usage

### Basic Usage

```bash
curl -X POST "http://localhost:8001/api/v1/submit" \
  -F "f_data=@myfile.txt" \
  -F "p_data=Please analyze this document" \
  -F "f_type=text" \
  -F "ai_report_id=existing-report-id-123"
```

### Image Analysis

```bash
curl -X POST "http://localhost:8001/api/v1/submit" \
  -F "f_data=@medical_image.jpg" \
  -F "p_data=What do you see in this medical image?" \
  -F "f_type=image" \
  -F "ai_report_id=medical-report-456"
```

### Python Example

```python
import aiohttp
import asyncio

async def submit_file():
    data = aiohttp.FormData()
    
    # Add file
    with open('test_file.txt', 'rb') as f:
        data.add_field('f_data', f, filename='test_file.txt')
    
    # Add form fields
    data.add_field('p_data', 'Please analyze this file')
    data.add_field('f_type', 'text')
    data.add_field('ai_report_id', 'existing-report-id-789')  # Must exist in Supabase
    
    async with aiohttp.ClientSession() as session:
        async with session.post('http://localhost:8001/api/v1/submit', data=data) as response:
            result = await response.json()
            print(f"AI Report ID: {result['ai_report_id']}")
            print(f"Analysis: {result['report_content']}")

asyncio.run(submit_file())
```

## System Prompt Configuration

The system prompt is hardcoded in the application configuration (`agent-service/config.py`) and automatically includes file ID injection.

### Default System Prompt Features:
- **File ID Integration**: Automatically injects the uploaded file's ID into the prompt
- **Comprehensive Analysis**: Thorough and systematic file analysis
- **Multi-format Support**: Document, image, medical, and text processing
- **Structured Output**: Markdown formatting with clear headings
- **Professional Tone**: Evidence-based and actionable insights
- **File Reference**: Encourages referencing the specific file ID in analysis

### Example of File ID Injection:
When you upload a file and it gets ID `file_abc123`, the system prompt automatically becomes:

```
You are an expert AI assistant specializing in comprehensive file analysis...

You have been provided with a file that has the ID: file_abc123

Instructions:
1. Analyze the provided file thoroughly and systematically
...
6. Reference the file ID (file_abc123) in your analysis when appropriate
```

### Customizing the System Prompt

To modify the system prompt template, update `SYSTEM_PROMPT_TEMPLATE` in `agent-service/config.py`. Make sure to include `{file_id}` placeholders where you want the file ID injected:

```python
SYSTEM_PROMPT_TEMPLATE: str = """Your custom system prompt here...

File being analyzed: {file_id}

Instructions:
1. Reference the file ID {file_id} in your analysis
2. Your other custom instructions...
"""
```

## Database Requirements

### Supabase Setup
Before using the API, ensure your Supabase database has:

1. **Table**: `ai_reports`
2. **Required Fields**: 
   - `id` (text/varchar) - Primary key
   - `content` (text) - Will be updated with AI response
   - `updatedAt` (timestamp) - Updated automatically

### Example Supabase Table Structure
```sql
CREATE TABLE ai_reports (
    id TEXT PRIMARY KEY,
    content TEXT,
    title TEXT,
    medicalHistoryId INTEGER,
    createdAt TIMESTAMP DEFAULT NOW(),
    updatedAt TIMESTAMP DEFAULT NOW()
);
```

### Pre-creating Records
Before calling the API, you must create a record in `ai_reports`:

```sql
INSERT INTO ai_reports (id, title, content) 
VALUES ('your-report-id-123', 'Analysis Title', 'Initial content');
```

## Testing

Use the provided test script to verify functionality:

```bash
cd agent-service
python test_new_submit.py
```

The test script includes:
- Basic text file analysis with required ai_report_id
- Image file analysis simulation
- Validation testing for missing ai_report_id
- Error handling for non-existent ai_report_id

## Configuration

Make sure your `.env` file contains:

```env
# AgentOS Configuration
AGENTOS_API_URL=http://localhost:8000
AGENTOS_USERNAME=your_username
AGENTOS_PASSWORD=your_password
TARGET_AGENT_UUID=your_agent_uuid

# Supabase Configuration
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_key

# Optional: Custom System Prompt (must include {file_id} placeholders)
SYSTEM_PROMPT_TEMPLATE="Your custom prompt with {file_id} injection..."
```

## Supported File Types

The service supports various file formats:

**Images:** jpg, jpeg, png, gif, bmp, webp, svg
**Documents:** pdf, doc, docx, txt, rtf, odt
**Text Files:** txt, md, csv, json, xml, yaml, yml

## Error Handling

The API handles various error scenarios:
- **Missing ai_report_id**: Returns 422 validation error
- **Non-existent ai_report_id**: Returns error response
- **File upload failures**: Network/API errors
- **AI processing timeouts**: 120 seconds maximum
- **Database connection issues**: Supabase client errors
- **WebSocket connection errors**: Connection failures

All errors are returned in the standardized format with descriptive error messages.

## Performance Notes

- **Maximum file size**: 10MB
- **Processing timeout**: 120 seconds
- **WebSocket connection timeout**: 2 seconds
- **Database operations**: Synchronous Supabase client calls
- **Automatic token caching**: Improved performance for multiple requests

## Migration Notes

### Breaking Changes from Previous Version:
1. **ai_report_id is now required** - Must exist in Supabase before API call
2. **No auto-generation of ai_report_id** - Must be provided in request
3. **Database operations changed** - Now updates existing records instead of creating new ones
4. **File ID injection** - System prompt now automatically includes uploaded file ID