# AgentOS Service

A FastAPI service that handles file uploads and communicates with the AgentOS backend via WebSocket.

## Features

- **FastAPI Server**: REST API for handling file uploads and processing
- **File Upload**: Handles various file types (images, text, documents)
- **AgentOS Integration**: WebSocket client for communicating with AgentOS backend
- **Prompt Processing**: Concatenates user input with predefined prompts
- **Session Management**: File storage and session tracking

## Complete Logic Flow

### Step-by-Step Process

1. **Receive Request**: POST to `/api/v1/submit` with:
   - `f_data`: File upload (image, document, text file)
   - `p_data`: User prompt text
   - `f_type`: File type ("image", "text", "document")

2. **Upload File**: Upload to AgentOS using genai-protocol FileManager → get `file_id`

3. **Create Message**: Concatenate `p_data` + `file_id` in prompt template:
   ```
   Please analyze the uploaded file with ID: {file_id} and provide insights based on the following user input:
   User Input: {p_data}
   Please provide a detailed analysis and response in markdown format.
   ```

4. **Send to Agent**: Send message to target agent using GenAI Session

5. **Agent Processing**: Agent analyzes file and generates markdown response

6. **Return Response**: Return markdown string to client as `{"r_data": "markdown_string", "success": true}`

## Installation

1. **Install dependencies**:
```bash
pip install -r requirements.txt
```

2. **Configure environment variables**:

**Option A: Using .env file (Recommended)**
```bash
# Copy sample configuration
cp sample.env .env

# Edit .env with your actual values
nano .env
```

**Option B: Export environment variables**
```bash
export AGENTOS_USERNAME="your_username"  # Required for dynamic authentication
export AGENTOS_PASSWORD="your_password"  # Required for dynamic authentication
export TARGET_AGENT_UUID="master_server_ml"  # For Master Agent (default)
```

**Required Variables**:
- `AGENTOS_USERNAME`: Your AgentOS username (required for dynamic JWT authentication)
- `AGENTOS_PASSWORD`: Your AgentOS password (required for dynamic JWT authentication)
- `TARGET_AGENT_UUID`: Agent to send messages to (default: "master_server_ml")

### Getting Required Information

To configure the service:

1. **Username/Password**: Use your AgentOS credentials - JWT tokens are generated automatically
2. **Target Agent UUID**: For the **Master Agent**, use `"master_server_ml"` (default). For other agents:
   - Use the GenAI CLI when registering agents
   - Get from the AgentOS dashboard
   - Call the `/api/agents` endpoint to list all agents

## Configuration

Edit `config.py` or set environment variables:

- `AGENTOS_API_URL`: AgentOS backend URL (default: http://localhost:8000)
- `AGENTOS_WS_URL`: AgentOS WebSocket URL (default: ws://localhost:8000)
- `AGENTOS_USERNAME`: Username for dynamic JWT authentication (required)
- `AGENTOS_PASSWORD`: Password for dynamic JWT authentication (required)
- `TARGET_AGENT_UUID`: UUID of the target agent to send messages to (default: "master_server_ml" for Master Agent)

**Note**: JWT tokens are now generated automatically using your username/password. Session IDs and Request IDs use fixed defaults (`3fa85f64-5717-4562-b3fc-2c963f66afa6`) for consistency.

## Usage

### Start the FastAPI Server

```bash
python run.py
```

Or:

```bash
python main.py
```

The service will run on `http://localhost:8001`

### API Endpoints

- `POST /api/v1/submit` - Submit file for processing
- `GET /api/v1/files/{file_id}` - Get file information
- `GET /health` - Health check
- `GET /docs` - API documentation

### Test the Service

```bash
python test_client.py
```

## Project Structure

```
agent-service/
├── main.py              # FastAPI application entry point
├── run.py               # Simple run script
├── config.py            # Configuration settings
├── client.py            # AgentOS WebSocket client
├── requirements.txt     # Dependencies
├── routers/
│   ├── __init__.py
│   └── submit_router.py # API routes
├── schemas/
│   ├── __init__.py
│   └── request_schemas.py # Pydantic schemas
├── services/
│   ├── __init__.py
│   ├── agent_service.py # AgentOS communication
│   └── file_service.py  # File operations
└── test_client.py       # Test client

```

## API Example

### Request
```bash
curl -X POST "http://localhost:8001/api/v1/submit" \
  -F "f_data=@business_report.pdf" \
  -F "p_data=Create a comprehensive analysis with key insights and recommendations" \
  -F "f_type=document"
```

### Successful Response (Markdown from Agent)
```json
{
  "r_data": "# Business Report Analysis\n\n## Key Findings\n\n- **Revenue Growth**: 15% increase in Q3\n- **Customer Acquisition**: 245 new customers\n- **Retention**: Strong 92% retention rate\n\n## Challenges Identified\n\n1. **Market Competition**: Increased competitive pressure\n2. **Supply Chain**: Delays impacting operations\n3. **Staffing**: Sales team turnover concerns\n\n## Strategic Recommendations\n\n### Immediate Actions\n- Implement customer retention programs\n- Diversify supplier relationships\n- Launch sales training initiatives\n\n### Long-term Strategy\n- Market differentiation focus\n- Technology investment for efficiency\n- Team development programs",
  "success": true
}
```

### Error Responses

Configuration Error:
```json
{
  "r_data": "Configuration error: No target agent UUID configured. Using default 'master_server_ml' for Master Agent.",
  "success": false
}
```

Agent Processing Error:
```json
{
  "r_data": "Agent processing failed: Agent timeout after 30 seconds",
  "success": false
}
```

## Development

The service integrates with AgentOS using the GenAI protocol by:

1. **File Upload**: Uses `genai-protocol` FileManager to upload files to AgentOS file service
2. **Agent Communication**: Uses `GenAISession.send()` to send messages to target agents
3. **Response Handling**: Receives `AgentResponse` objects with execution results
4. **Fallback Support**: Includes custom WebSocket client for direct messaging if needed

### Architecture

```
Client Request → FastAPI → Upload File (GenAI Protocol) → Send Message (GenAI Session) → Target Agent → Response
```

### Key Components

- **FileManager**: Handles file uploads using genai-protocol
- **GenAISession**: Manages agent-to-agent communication  
- **AgentResponse**: Contains response data and execution metadata
- **WebSocket Client**: Fallback for direct AgentOS communication 