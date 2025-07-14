import asyncio
from typing import Annotated
from genai_session.session import GenAISession
from genai_session.utils.context import GenAIContext
from openai import OpenAI
from dotenv import load_dotenv
import os
import json

# AGENT_JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhNDc3NjI4ZC1hMjUxLTQwYWUtOTg0Mi0wZTc5ODEyNjk3MzQiLCJleHAiOjI1MzQwMjMwMDc5OSwidXNlcl9pZCI6IjhhNTM3MjVmLTMzNzAtNDk3ZS05MDU5LWQ1MmRmOTdmZjE0OSJ9.BZRLRvjLBxWStsq9iCRNQ-ywek9v46QFZi9qA8x_l_4" # noqa: E501
AGENT_JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2Yzg2YjAxOC0yZjMyLTRiYjEtYWY3Yi01MjcxYjA1NzY2NTciLCJleHAiOjI1MzQwMjMwMDc5OSwidXNlcl9pZCI6ImIwMTM2YTM4LTUwNjUtNGM1ZC1iZTZhLTE1YjNjOGU0YTJlYyJ9.fOxgoEo8QrK-OY_qu3py5yMx1wqRnGokCliTseBmX9U"

session = GenAISession(jwt_token=AGENT_JWT)

load_dotenv()

OPENAPI_KEY = os.environ.get("OPENAPI_KEY")

openai_client = OpenAI(api_key=OPENAPI_KEY, base_url="https://api.braintrust.dev/v1/proxy")

@session.bind(
    name="diagnosis_reasoner",
    description="Suggest 1–3 likely diagnoses based on structured patient triage data and lab test results with justifications."
)
async def diagnosis_reasoner(
    agent_context: GenAIContext,
    triage_report: Annotated[str, "JSON string output from Symptom Triage Agent"],
    lab_results: Annotated[str, "Optional JSON string containing lab test results summary"] = None
):
    """
    Suggest possible diagnoses based on structured triage data and lab results:
    - age
    - gender
    - medical_history
    - symptoms
    - duration
    - severity
    - lab test results
    """
    agent_context.logger.info("Running Diagnosis Reasoning Agent")
    
    # Parse the JSON strings
    if isinstance(triage_report, str):
        triage_data = json.loads(triage_report)
    else:
        triage_data = triage_report

    lab_data = None
    if lab_results:
        if isinstance(lab_results, str):
            lab_data = json.loads(lab_results)
        else:
            lab_data = lab_results

    # Build the context for the prompt
    clinical_context = f"""
Based on the following structured triage data:
{triage_data}

{"Additional laboratory findings:" if lab_data else ""}
{lab_data if lab_data else ""}
"""

    prompt = f"""
You are an AI clinical assistant.

{clinical_context}

Suggest the 1–3 most likely diagnoses.

For each condition, return:
- the name of the condition
- confidence level: low | medium | high
- a brief justification (e.g., based on symptoms, lab results, risk factors, history)

Return only in the following JSON format:
{{
  "diagnoses": [
    {{
      "condition": "condition name",
      "confidence": "low | medium | high",
      "justification": "short medical reasoning including relevant lab findings if available"
    }},
    ...
  ]
}}
"""

    response = openai_client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[{"role": "user", "content": prompt}],
        temperature=0.3
    )

    result = response.choices[0].message.content.strip()
    parsed_result = json.loads(result)  # Parse JSON string to dict
    agent_context.logger.info(f"Diagnosis reasoning result: {parsed_result}")

    return parsed_result  # Return the parsed dict directly, not wrapped in another dict

async def main():
    print(f"Agent with token '{AGENT_JWT}' started")
    await session.process_events()

if __name__ == "__main__":
    asyncio.run(main())