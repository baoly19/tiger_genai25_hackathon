import asyncio
from typing import Annotated
from genai_session.session import GenAISession
from genai_session.utils.context import GenAIContext
import base64
from fastmcp import Client

# AGENT_JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI4YmY0MDQwMy03MmNhLTQ2MjMtYWRiYy1iN2M0Nzk0YzU1ZGMiLCJleHAiOjI1MzQwMjMwMDc5OSwidXNlcl9pZCI6IjhhNTM3MjVmLTMzNzAtNDk3ZS05MDU5LWQ1MmRmOTdmZjE0OSJ9.6oOUTAdPCbhsI09d7HgcFvSzhKaIvTexvw-QS0hqny8" # noqa: E501
AGENT_JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI3YTc0NGRmYS1mYTE4LTRjZDUtOTdmYS0wN2E2NWIwMmUxMWIiLCJleHAiOjI1MzQwMjMwMDc5OSwidXNlcl9pZCI6ImIwMTM2YTM4LTUwNjUtNGM1ZC1iZTZhLTE1YjNjOGU0YTJlYyJ9.pqtjauypxktyi9xTlsXjwYraADTezUu4cM1CutA6jfo"
session = GenAISession(jwt_token=AGENT_JWT)

MCP_URL = "https://471284188f4a.ngrok-free.app/mcp"
@session.bind(
    name="get_image_and_upload_mcp",
    description="Get image and upload to ai mcp server"
)
async def get_image_and_upload_mcp(
    agent_context: GenAIContext,
    file_id: Annotated[str, "ID of the image file to upload"]
):
    # 1. Get the file content
    file = await agent_context.files.get_by_id(file_id)
    file_bytes = file.read()

    # 2. Convert to base64
    b64_img = base64.b64encode(file_bytes).decode("utf-8")

    async with Client(MCP_URL) as client:
        # 2. Upload the image
        upload_result = await client.call_tool("upload_image", {"b64": b64_img})
        
        # Extract the upload URI from the TextContent object
        upload_uri = upload_result[0].text
        print("✅ Uploaded:", upload_uri)

        return {
            "status": "uploaded",
            "image_uri": upload_uri
        }

async def main():
    print(f"Agent with token '{AGENT_JWT}' started")
    await session.process_events()

if __name__ == "__main__":
    asyncio.run(main())
