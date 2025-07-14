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


A huge thank to the team [GenAI-AgentOS](https://github.com/genai-works-org/genai-agentos) for the agent infrastructure
We would like to thank the following open-source frameworks and contributors who made this project possible:

| Framework/Tool           | Description                                                                        | Logo                                                                                                                                                                                                                           |
| ------------------------ | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **GenAI-AgentOS**        | Open multi-agent orchestration platform powering the diagnostic workflows          | <img src="https://raw.githubusercontent.com/genai-agentos/agentos/main/docs/logo.png" alt="AgentOS" width="80"/>                                                                                                               |
| **FastMCP**              | Lightweight multi-agent control panel enabling async agent routing and management  | <img src="https://fastmcp.ai/logo.svg" alt="FastMCP Logo" width="80"/>                                                                                                                                                         |
| **Flutter**              | Cross-platform UI toolkit used to build our responsive and intuitive web interface | <img src="https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png" alt="Flutter Logo" width="60"/>                                                                                                         |
| **FastAPI**              | Modern Python web framework for our backend service                                | <img src="https://fastapi.tiangolo.com/img/logo-margin/logo-teal.png" alt="FastAPI Logo" width="60"/>                                                                                                                          |
| **OpenAI / HuggingFace** | Foundational models and inference APIs for medical and multimodal AI capabilities  | <img src="https://upload.wikimedia.org/wikipedia/commons/4/4f/OpenAI_Logo.svg" alt="OpenAI Logo" width="60"/> <img src="https://huggingface.co/front/assets/huggingface_logo-noborder.svg" alt="HuggingFace Logo" width="60"/> |

This project is inspired by recent advances in AI for healthcare, clinical NLP, and multimodal diagnosis systems:
```
MedVLM: Towards Generalist Biomedical Vision-Language Models with Medical Knowledge Enhanced Pretraining
Liang, J., et al., Computer Methods and Programs in Biomedicine, 2024.
PMID: 38501513

GatorTron: A Large Clinical Language Model to Unlock Patient Information from Unstructured Electronic Health Records
Yang, X., et al., npj Digital Medicine, 2022.
PMID: 35788535

Large Language Models Encode Clinical Knowledge
Singhal, K., et al., Nature, 2023.
PMID: 37097425

Clinical Decision Support Systems Using AI: Review and Opportunities
Rajkomar, A., et al., The Lancet Digital Health, 2022.
PMID: 35120945

Vision-Language Models for Medical Imaging: A Review of Current Applications and Future Directions
Huang, K., et al., Journal of Biomedical Informatics, 2023.
PMID: 37088422

Mixture of Experts Models in Healthcare AI: Routing Tasks Across Specialized Subnetworks
Ramesh, A., et al., arXiv:2101.03961 (adapted in clinical NLP pipelines)

ClinicalBERT: Modeling Clinical Notes and Predicting Hospital Readmission
Alsentzer, E., et al., PMLR, 2019.
PMID: 31576177
```
---

## ✨ Contact

For any questions or collaboration interests, please contact the project maintainers [Nhat Bui](mailto:lyngocgiabao1958@gmail.com), [Bao Ly](mailto:nhat117@gmail.com), and [Minh Dau](mailto::dauhoangminh9@gmail.com). 

