# GenAI Medical Diagnosis Platform

This repository contains the complete solution for an AI-powered medical diagnosis platform. It includes a Flutter-based frontend, a FastAPI backend service, collaborative research components, and a set of intelligent agents for processing and diagnosing patient medical data using the GenAI-AgentOS framework.

This repo is part of submission for the [LeadWithAIAgents hackathon](https://genai.works/hackathon#judges)
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
A **forked and customized version** of [GenAI-AgentOS](https://github.com/genai-works-org/genai-agento), enhanced to:
- Implement diagnosis-specific agents
- Integrate with FastAPI service triggers
- Support custom workflows tailored for medical use cases

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

For any questions or collaboration interests, please contact the project maintainer.
