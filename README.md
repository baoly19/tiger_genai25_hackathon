# 🏥 AutoClinicAI System - Team Tiger

![Logo](https://private-user-images.githubusercontent.com/72547907/465959586-6d213bb6-1f6e-4981-a061-acb97214e28c.jpg?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTI0ODg0MjAsIm5iZiI6MTc1MjQ4ODEyMCwicGF0aCI6Ii83MjU0NzkwNy80NjU5NTk1ODYtNmQyMTNiYjYtMWY2ZS00OTgxLWEwNjEtYWNiOTcyMTRlMjhjLmpwZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MTQlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzE0VDEwMTUyMFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWU3OGM2ODIzZGFhMWE2NTBmZWM2YTY0ODMyMTRiZGU0MDRjODQyOTZiOGY2ZjJmNzdjNTg4MzEyMDkzMGU0ZWImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.4a-IPZmwQBsQuOnvu9or1nmg2Zf4AXas93D6e3Hz88Q)

This repository contains the complete solution for an AI-powered medical diagnosis platform. It includes a Flutter-based frontend, a FastAPI backend service, and a set of intelligent agents for processing and diagnosing patient medical data using the GenAI-AgentOS framework.

⚠️ Go to the [Genai-agentos Folder](./genai-agentos/) for simple demo setup and detailed stup instruction on the AgentOS platform

This repo is part of submission for the [LeadWithAIAgents hackathon](https://genai.works/hackathon#judges)

Visit our notion page for full information [Notion](https://www.notion.so/Team-Tiger-Documentation-23050dd93a9c8006989ff199a77e21d7)
---

## 🗂️ Repository Structure

```

genai\_frontend/    → Flutter web app for user interface and AI diagnosis interaction
agent-service/     → FastAPI backend handling file uploads and triggering diagnosis via GenAI-AgentOS
collab/            → Jupyter Notebook hosting the MCP server
genai-agentos/     → Forked GenAI-AgentOS repository containing custom diagnosis agents

````

---

## 🔍 Project Overview

### 1. `genai_frontend/`  
A **Flutter web application** that serves as the user interface. Key features:
- Upload patient files (e.g., medical reports or x-rays)
- Submit medical data for AI-powered diagnosis
- View results and analysis from the GenAI agents

### 2. `agent-service/`  
A **Python FastAPI service** with two core responsibilities:
- Handle secure file uploads from the frontend
- Initiate agent-based diagnostic workflows by interfacing with GenAI-AgentOS

### 3. `collab/`  
Contains a **Jupyter Notebook** used to host and coordinate the **MCP server**, enabling distributed agent execution for diagnosis.

### 4. `genai-agentos/`  
A **customized version** of [GenAI-AgentOS](https://github.com/genai-works-org/genai-agento) for our solution of AutoClinic.ai, enhanced to:
- Implement diagnosis-specific agents
- Support custom workflows tailored for medical diagnosis and treatment planning use cases

  ---

## 📄 Issue

We have created an account with Cloudera but are currently encountering the following issue.



![Cloudera](https://private-user-images.githubusercontent.com/72547907/465961169-285f02ba-dd11-4ef1-86ae-97e1f2abfe69.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTI0ODg2MDYsIm5iZiI6MTc1MjQ4ODMwNiwicGF0aCI6Ii83MjU0NzkwNy80NjU5NjExNjktMjg1ZjAyYmEtZGQxMS00ZWYxLTg2YWUtOTdlMWYyYWJmZTY5LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MTQlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzE0VDEwMTgyNlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTI3M2MwNzY3M2M0ZGY1NjNlYzgyOWY1NmM3YWIyYjI5MDNjMzcxNGU0YjYzODdhZmIwOWUwZGRmYWI5MDhjZTgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.H4dltEiqfe6p67xomhm6MOyFr51qlYLpkMRyHCphd-I)

---

## 📄 License

This repository is a submission project and builds upon the [GenAI-AgentOS](https://github.com/genai-works-org/genai-agentos) under its respective license.

---

## 🙌 Acknowledgments

* [GenAI-AgentOS](https://github.com/genai-works-org/genai-agentos) for the agent infrastructure
* Flutter and FastAPI for the development stack
* All contributors and open-source libraries involved in this solution

---

## ✨ Contact

For any questions or collaboration interests, please contact the project maintainers [Nhat Bui](mailto:lyngocgiabao1958@gmail.com), [Bao Ly](mailto:nhat117@gmail.com), and [Minh Dau](mailto::dauhoangminh9@gmail.com). 

