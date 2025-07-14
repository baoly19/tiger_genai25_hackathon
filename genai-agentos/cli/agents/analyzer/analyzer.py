import asyncio
from typing import Annotated
from genai_session.session import GenAISession
from genai_session.utils.context import GenAIContext
from openai import OpenAI
from dotenv import load_dotenv
import os
import json

load_dotenv()

OPENAPI_KEY = os.environ.get("OPENAPI_KEY")


# AGENT_JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMmQ1NjZkMC1iNGRlLTQ4M2YtYmJkYS0wMThjMTM1ODI2NjgiLCJleHAiOjI1MzQwMjMwMDc5OSwidXNlcl9pZCI6ImIwMTM2YTM4LTUwNjUtNGM1ZC1iZTZhLTE1YjNjOGU0YTJlYyJ9.-OzuF5BwDtLe07nNct7JmnoZwsnA14bH7juxXJEN-b8" # noqa: E501
AGENT_JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwODhiM2U2Zi01OGYyLTQ1NDctYjQ0ZC05ZGJmZDA2NTY0YjMiLCJleHAiOjI1MzQwMjMwMDc5OSwidXNlcl9pZCI6ImIwMTM2YTM4LTUwNjUtNGM1ZC1iZTZhLTE1YjNjOGU0YTJlYyJ9.0c2MyGE16OjnsvMcBIb2Ndy--OhChL5C59qFjC8J4Z8"


openai_client = OpenAI(api_key=OPENAPI_KEY, base_url="https://api.braintrust.dev/v1/proxy")
session = GenAISession(jwt_token=AGENT_JWT)


@session.bind(
    name="analyzer",
    description="Extract structured triage information from the patient's free-text input. This includes age, gender, relevant medical history, current symptoms, duration, severity, and an overall triage level."
)

async def analyzer(
    agent_context: GenAIContext,
    text: Annotated[str, "Patient's free-text symptoms and description"]
):
    """
    Analyze the patient's symptom description and extract structured triage information.
    """

    agent_context.logger.info("Running Symptom Triage Agent")

    prompt = f"""
    You are an AI medical assistant.

    A patient has submitted the following description:
    \"\"\"
    {text}
    \"\"\"

    Your task is to extract useful information that will assist in triage and future diagnosis.

    Return only a JSON object in the following format:
    {{
    "age": "patient's age if stated or inferred (e.g. 'unknown', 'about 30')",
    "gender": "male | female | unknown",
    "medical_history": [list of relevant past conditions or 'unknown'],
    "symptoms": [list of current symptoms],
    "duration": "duration of symptoms (e.g., '2 days')",
    "severity": "mild | moderate | severe",
    "triage_level": "low | medium | high"
    }}

    Be concise and strictly follow this structure.
    """

    response = openai_client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[{"role": "user", "content": prompt}],
        temperature=0.3
    )

    result = response.choices[0].message.content.strip()
    parsed_result = json.loads(result)  # Parse JSON string to dict
    agent_context.logger.info(f"Triage agent result: {parsed_result}")

    return {"triage_report": parsed_result}


async def main():
    print(f"Agent with token '{AGENT_JWT}' started")
    await session.process_events()

if __name__ == "__main__":
    asyncio.run(main())
