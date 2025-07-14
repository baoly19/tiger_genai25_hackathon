#!/usr/bin/env python3
"""
Simple file upload script using genai-protocol (for external use)
Run this from outside Docker containers
"""

import asyncio
import aiohttp
import sys
import os

# You'll need to install: pip install aiohttp genai-protocol
try:
    from genai_session.utils.file_manager import FileManager
except ImportError:
    print("❌ Please install genai-protocol: pip install genai-protocol")
    sys.exit(1)


class SimpleFileUploader:
    def __init__(self, username: str, password: str, api_base_url: str = "http://localhost:8000"):
        self.username = username
        self.password = password
        self.api_base_url = api_base_url
        self.jwt_token = None
    
    async def get_jwt_token(self) -> str:
        """Get JWT token using OAuth2 flow"""
        data = {
            'grant_type': 'password',
            'username': self.username,
            'password': self.password,
            'scope': '',
            'client_id': 'string',
            'client_secret': 'string'
        }
        
        async with aiohttp.ClientSession() as session:
            async with session.post(
                f"{self.api_base_url}/api/login/access-token",
                headers={
                    'accept': 'application/json',
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                data=data
            ) as response:
                if response.status == 200:
                    result = await response.json()
                    self.jwt_token = result.get('access_token')
                    print(f"✅ Successfully got JWT token")
                    return self.jwt_token
                else:
                    error_text = await response.text()
                    raise Exception(f"Failed to get JWT token: {response.status} - {error_text}")
    
    async def upload_file(self, file_path: str, session_id: str = None, request_id: str = None) -> str:
        """Upload a file and return the file_id"""
        if not self.jwt_token:
            await self.get_jwt_token()
        
        # Use default IDs if not provided
        if not session_id:
            import uuid
            session_id = str(uuid.uuid4())
        if not request_id:
            import uuid
            request_id = str(uuid.uuid4())
        
        # Create file manager
        file_manager = FileManager(
            api_base_url=self.api_base_url,
            session_id=session_id,
            request_id=request_id,
            jwt_token=self.jwt_token
        )
        
        # Read file content
        with open(file_path, 'rb') as f:
            file_content = f.read()
        
        # Extract filename
        filename = os.path.basename(file_path)
        
        # Upload file
        print(f"📤 Uploading file: {filename}")
        file_id = await file_manager.save(file_content, filename)
        print(f"✅ File uploaded successfully! File ID: {file_id}")
        
        return file_id


async def main():
    """Example usage"""
    if len(sys.argv) < 2:
        print("Usage: python simple_upload_external.py <file_path>")
        print("Example: python simple_upload_external.py my_image.jpg")
        return
    
    # Configuration
    USERNAME = "nhat117"
    PASSWORD = "Stevejobs1@"
    FILE_PATH = sys.argv[1]
    
    if not os.path.exists(FILE_PATH):
        print(f"❌ File not found: {FILE_PATH}")
        return
    
    # Create uploader
    uploader = SimpleFileUploader(USERNAME, PASSWORD)
    
    try:
        # Upload file
        file_id = await uploader.upload_file(FILE_PATH)
        
        print(f"\n🎉 Success!")
        print(f"File ID: {file_id}")
        print(f"You can now use this file_id in your agents or API calls")
        
    except Exception as e:
        print(f"❌ Error: {str(e)}")


if __name__ == "__main__":
    asyncio.run(main()) 