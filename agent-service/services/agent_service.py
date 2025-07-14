"""
Agent service for processing files using direct HTTP API calls and chat client approach.
"""

import aiohttp
import json
import asyncio
import websocket
import threading
import time
import base64
from datetime import datetime
from typing import Dict, Any, Optional
from urllib.parse import urlencode
from supabase import create_client, Client  # Re-enabled
from genai_session.session import GenAISession
from genai_session.utils.agents import AgentResponse
from config import settings


class AgentService:
    """Service for processing files using direct HTTP API calls and chat client approach."""

    def __init__(self):
        self.genai_session = None
        self.api_key = settings.AGENTOS_API_KEY
        self.api_base_url = settings.AGENTOS_API_URL
        self.ws_url = settings.AGENTOS_WS_URL
        self.target_agent_uuid = settings.TARGET_AGENT_UUID
        self.username = settings.AGENTOS_USERNAME
        self.password = settings.AGENTOS_PASSWORD
        self._cached_token = None

        # Supabase client - RE-ENABLED
        self.supabase: Client = create_client(settings.SUPABASE_URL, settings.SUPABASE_ANON_KEY)

        # Chat client variables
        self.ws = None
        self.last_response = None
        self.response_received = False

    async def _get_access_token(self) -> str:
        """Get access token dynamically - always authenticate with username/password."""

        # Check if we have a cached token that's still valid
        if self._cached_token and self._is_token_valid(self._cached_token):
            print(f"🔄 Using cached JWT token")
            return self._cached_token

        # Clear invalid or expired token
        if self._cached_token:
            self._clear_cached_token()

        # Always authenticate dynamically with username/password
        print(f"🔑 Authenticating with username/password to get fresh JWT token")
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
                data=data,
                headers={
                    'accept': 'application/json',
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            ) as response:
                if response.status != 200:
                    error_text = await response.text()
                    raise ValueError(f"Failed to get access token: {response.status} - {error_text}")

                result = await response.json()
                token = result.get('access_token')
                if not token:
                    raise ValueError("No access token in response")

                # Cache the new token
                self._cached_token = token
                print(f"✅ Fresh JWT token obtained via authentication")
                return token

    def _is_token_valid(self, token: str) -> bool:
        """Check if JWT token is still valid (not expired)."""
        try:
            # Decode JWT payload (without verification for expiration check)
            parts = token.split('.')
            if len(parts) != 3:
                return False

            # Decode the payload (second part)
            payload = parts[1]
            # Add padding if needed
            payload += '=' * (4 - len(payload) % 4)
            decoded = base64.urlsafe_b64decode(payload)
            payload_data = json.loads(decoded)

            # Check expiration
            exp = payload_data.get('exp')
            if not exp:
                return False

            current_time = time.time()
            if current_time >= exp:
                print(f"⏰ JWT token expired at {datetime.fromtimestamp(exp)}")
                return False

            print(f"✅ JWT token valid until {datetime.fromtimestamp(exp)}")
            return True

        except Exception as e:
            print(f"❌ Error validating JWT token: {e}")
            return False

    def _clear_cached_token(self):
        """Clear the cached token to force re-authentication."""
        self._cached_token = None
        print(f"🧹 Cleared cached JWT token")

    async def _upload_file_direct(self, file_content: bytes, filename: str, session_id: str, request_id: str) -> str:
        """Upload file using the exact curl command format with token refresh on auth failure."""

        # Try upload with current token
        for attempt in range(2):  # Allow one retry
            token = await self._get_access_token()

            # Create form data exactly like the curl command
            data = aiohttp.FormData()
            data.add_field('file', file_content, filename=filename, content_type='application/octet-stream')
            data.add_field('request_id', request_id)
            data.add_field('session_id', session_id)

            async with aiohttp.ClientSession() as session:
                async with session.post(
                    f"{self.api_base_url}/files",
                    data=data,
                    headers={
                        'accept': 'application/json',
                        'Authorization': f'Bearer {token}'
                    }
                ) as response:
                    if response.status in [200, 201]:
                        result = await response.json()
                        file_id = result.get('id')
                        if not file_id:
                            raise ValueError("No file ID in upload response")

                        print(f"✅ File uploaded successfully. File ID: {file_id}")
                        return file_id

                    # If authentication failed, clear token and retry
                    if response.status == 401 and attempt == 0:
                        print(f"🔄 Authentication failed, clearing token and retrying...")
                        self._clear_cached_token()
                        continue

                    # Other errors or final attempt
                    error_text = await response.text()
                    raise ValueError(f"Failed to upload file: {response.status} - {error_text}")

        raise ValueError("Upload failed after retries")

    async def _get_model_configs(self, token: str) -> list:
        """Get available model configurations."""
        async with aiohttp.ClientSession() as session:
            async with session.get(
                f"{self.api_base_url}/api/llm/model/configs",
                headers={
                    'Authorization': f'Bearer {token}',
                    'accept': 'application/json'
                }
            ) as response:
                if response.status == 200:
                    providers = await response.json()
                    all_configs = []
                    for provider in providers:
                        provider_name = provider.get('provider', 'Unknown')
                        configs = provider.get('configs', [])

                        for config in configs:
                            config['provider'] = provider_name
                            all_configs.append(config)

                    return all_configs
                else:
                    print(f"⚠️ Failed to get model configs: {response.status}")
                    return []

    def _on_message(self, ws, message):
        """Handle incoming WebSocket messages"""
        try:
            data = json.loads(message)

            if data.get('type') == 'agent_response':
                response_data = data.get('response', {})
                agent_response = response_data.get('response', {})

                self.last_response = agent_response.get('response', 'No response')
                self.response_received = True
                print(f"✅ Agent response received: {len(self.last_response)} characters")

            elif 'error' in data:
                self.last_response = f"Error: {data['error']}"
                self.response_received = True
                print(f"❌ Error: {data['error']}")

        except json.JSONDecodeError:
            print(f"📨 Non-JSON message: {message}")

    def _on_error(self, ws, error):
        """Handle WebSocket errors"""
        print(f"❌ WebSocket error: {error}")
        self.response_received = True

    def _on_close(self, ws, close_status_code, close_msg):
        """Handle WebSocket close"""
        print(f"🔌 WebSocket connection closed: {close_status_code} - {close_msg}")

    def _on_open(self, ws):
        """Handle WebSocket open"""
        print(f"🔗 WebSocket connected successfully!")

    async def _send_via_websocket(self, message: str, file_id: str, session_id: str) -> str:
        """Send message via WebSocket and wait for response"""
        token = await self._get_access_token()

        # Get model configs
        configs = await self._get_model_configs(token)
        if not configs:
            raise ValueError("No model configurations available")

        first_config = configs[0]
        llm_name = first_config.get('name', 'default')
        provider = first_config.get('provider', 'openai')

        # Build WebSocket URL
        ws_base_url = self.api_base_url.replace("http://", "ws://").replace("https://", "wss://")
        params = {'token': token, 'session_id': session_id}
        ws_url = f"{ws_base_url}/frontend/ws?{urlencode(params)}"

        # Reset response tracking
        self.last_response = None
        self.response_received = False

        # Create WebSocket connection
        self.ws = websocket.WebSocketApp(
            ws_url,
            on_message=self._on_message,
            on_error=self._on_error,
            on_close=self._on_close,
            on_open=self._on_open
        )

        # Start WebSocket in a separate thread
        ws_thread = threading.Thread(target=self.ws.run_forever)
        ws_thread.daemon = True
        ws_thread.start()

        # Wait for connection
        await asyncio.sleep(2)

        # Send message
        message_data = {
            "message": message,
            "llm_name": llm_name,
            "provider": provider,
            "file_id": file_id
        }

        try:
            self.ws.send(json.dumps(message_data))
            print(f"📤 Sent message via WebSocket")

            # Wait for response (max 120 seconds)
            timeout = 120
            elapsed = 0
            while not self.response_received and elapsed < timeout:
                await asyncio.sleep(1)
                elapsed += 1

            if not self.response_received:
                raise ValueError("Timeout waiting for AI response")

            return self.last_response or "No response received"

        finally:
            if self.ws:
                self.ws.close()

    def _query_ai_report(self, ai_report_id: str) -> Optional[Dict[str, Any]]:
        """
        Query ai_reports table by ID.
        
        Args:
            ai_report_id: The ID to query for
            
        Returns:
            Dict with report data if found, None if not found or error
        """
        try:
            print(f"🔍 Querying ai_reports table for ID: {ai_report_id}")

            # Convert string ID to int if needed
            try:
                report_id = int(ai_report_id)
            except ValueError:
                print(f"❌ Invalid ai_report_id format: {ai_report_id} (must be integer)")
                return None

            response = self.supabase.table("ai_reports").select("*").eq("id", report_id).execute()

            if response.data and len(response.data) > 0:
                report = response.data[0]
                print(f"✅ Found report: ID={report['id']}, Title='{report.get('title', 'N/A')}'")
                return report
            else:
                print(f"❌ No report found with ID: {ai_report_id}")
                return None

        except Exception as e:
            print(f"❌ Error querying ai_reports: {str(e)}")
            return None

    def _update_ai_report_content(self, ai_report_id: str, content: str) -> bool:
        """
        Update the content field of an ai_report.
        
        Args:
            ai_report_id: The ID of the report to update
            content: The new content to set
            
        Returns:
            True if successful, False otherwise
        """
        try:
            print(f"📝 Updating ai_reports content for ID: {ai_report_id}")

            # Convert string ID to int if needed
            try:
                report_id = int(ai_report_id)
            except ValueError:
                print(f"❌ Invalid ai_report_id format: {ai_report_id} (must be integer)")
                return False

            response = self.supabase.table("ai_reports").update({
                "content": content
            }).eq("id", report_id).execute()

            if response.data and len(response.data) > 0:
                print(f"✅ Successfully updated report content for ID: {ai_report_id}")
                return True
            else:
                print(f"❌ Failed to update report content - no rows affected")
                return False

        except Exception as e:
            print(f"❌ Error updating ai_reports content: {str(e)}")
            return False

    async def process_complete_workflow(self, file_content: bytes, filename: str, user_data: str, 
                                      session_id: str, ai_report_id: str, file_type: str = "") -> Dict[str, Any]:
        """
        Complete workflow: get token → upload file → send to agent → return response.
        
        Args:
            file_content: File binary data
            filename: Name of the file
            user_data: User prompt text
            session_id: Session ID for tracking
            ai_report_id: AI report ID (validated against database)
            file_type: File type/extension for specialized analysis
        
        Returns:
            Dict with ai_report_id, content, and success status
        """
        created_at = datetime.utcnow()

        try:
            print(f"🚀 Starting complete workflow for AI Report ID: {ai_report_id}")

            # STEP 1: Query existing ai_report from Supabase
            existing_report = self._query_ai_report(ai_report_id)
            if not existing_report:
                raise ValueError(f"AI report with ID {ai_report_id} not found in database")

            # Step 2: Upload file using direct HTTP API (use fixed request_id)
            file_id = await self._upload_file_direct(file_content, filename, session_id, settings.DEFAULT_REQUEST_ID)

            # Step 3: Create enhanced message with all context from request
            # Format the simplified system prompt with essential context including patient data
            # TODO: Have a fallback
            print(file_type)
            if file_type == 'pdf':
                enhanced_system_prompt = settings.PDF_SYSTEM_PROMPT_TEMPLATE.format(
                    file_id=file_id,
                    filename=filename,
                    file_type=file_type,
                    patient_data=user_data,
                )
            else:
                enhanced_system_prompt = settings.SYSTEM_PROMPT_TEMPLATE.format(
                    file_id=file_id,
                    filename=filename,
                    file_type=file_type,
                    patient_data=user_data
                )

            # Create the complete message using enhanced template
            full_message = settings.ENHANCED_PROMPT_TEMPLATE.format(
                system_prompt=enhanced_system_prompt
            )

            print(f"📝 Using simplified system prompt with context:")
            print(f"   File: {filename} ({file_type})")
            print(f"   File ID: {file_id}")
            print(f"   Patient Data: {user_data}")
            print(f"\n🔍 Full System Prompt:\n{enhanced_system_prompt}")
            print(f"\n🔍 Complete Message:\n{full_message}")

            # Step 4: Send to agent using WebSocket approach
            ai_content = await self._send_via_websocket(full_message, file_id, session_id)

            if not ai_content or ai_content.startswith("Error:"):
                raise ValueError(f"Agent processing failed: {ai_content}")

            # STEP 5: Update ai_report content in Supabase
            update_success = self._update_ai_report_content(ai_report_id, ai_content)
            if not update_success:
                print(f"⚠️ Failed to update Supabase record, but AI processing succeeded")
                # Don't fail the entire workflow if DB update fails

            # Step 6: Return structured response
            return {
                'ai_report_id': ai_report_id,
                'content': ai_content,
                'createdAt': created_at,
                'success': True
            }

        except Exception as e:
            error_msg = str(e)
            print(f"❌ Workflow failed: {error_msg}")

            return {
                'ai_report_id': ai_report_id,
                'content': '',
                'createdAt': created_at,
                'success': False,
                'error': error_msg
            } 
