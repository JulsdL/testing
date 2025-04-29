# FalcCrew

Welcome to **FalcCrew**, a project that uses `crewAI` to simplify working with multi-agent AI systems. FalcCrew makes it easier to build, modify, and manage AI agents that collaborate on complex tasks.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Chainlit Integration](#chainlit-integration)
- [Project Structure](#project-structure)
- [Testing](#testing)
- [Support](#support)
- [License](#license)

---

## Overview

FalcCrew orchestrates multiple AI agents, each focused on specific tasks. These agents collaborate to produce simplified text documents using **FALC (Français Facile à Lire et à Comprendre)** guidelines. You can customize the agents, their tasks, and any specialized tools they require.

---

## Features

- **Multi-Agent Collaboration**
  Define and organize multiple AI agents to perform tasks in sequence or parallel.

- **Easy Configuration**
  Control tasks, agents, and tools via YAML files (`src/falc_crew/config/`).

- **Document Processing**
  Extract text from `.docx` files, rewrite in FALC style, and embed custom icons.

- **Chainlit Integration**
  Debug and visualize task progress in real-time.

- **Session Isolation**
  Each user session handles its own uploads and outputs separately.

- **Training Flow**
  Optional training mode to refine how tasks are performed.

---

## Installation

### Prerequisites

- **Python**: >= 3.10, < 3.13
- **pip** or your preferred Python package manager

---

### Steps

#### 1. Clone the Repository

```bash
git clone https://github.com/<your_user>/falc_crew.git
cd falc_crew
```
#### 2. Install Dependencies
FalcCrew uses UV for dependency management. If you don't have it installed:

```bash
pip install uv
```

Then, install the dependencies:

```bash
uv install
```

#### 3. Set Environment Variables

```bash
cp .env_example .env
```

Edit the .env file and add your required secrets, such as:

```bash
OPENAI_API_KEY=your_openai_api_key
```

## Configuration

### Environment Variables

Set the following in your local `.env` file:

- `MODEL`
  Example: `gpt-4.1-mini`

- `OPENAI_API_KEY`
  Example: `sk-<your-key>`

- `LANGFUSE_SECRET_KEY`

- `LANGFUSE_PUBLIC_KEY`

- `LANGFUSE_HOST`

---

### Agents and Tasks

Inside src/falc_crew/config:

- agents.yaml: Describes each agent, its role, and the tools it can use.

```	yaml
falc_translator:
  role: "FALC Translator"
  goal: "Convert complex text into simpler FALC text..."
  ...
falc_document_designer:
  role: "Accessible Document Designer"
  ...
```


- tasks.yaml: Describes each task the crew will execute.
```yaml
translate_text_task:
  description: "Translate given text to FALC..."
  ...
rewrite_original_doc_task:
  description: "Update original doc with the FALC translation..."
  ...
```

### Knowledge Sources

Store all reference materials, icons, and domain-specific guidelines in the following directory:

- src/falc_crew/knowledge_sources:
  - icons.json: Maps icon keys to local image paths
  - falc_guidelines.md: Contains FALC guidelines and rules.
  - icons/: Directory for storing icon images.
```

## Usage

### Running the Project

From the root directory, run:

```bash
crewai run
```

This command launches the multi-agent flow defined in agents.yaml and tasks.yaml.
- By default it processes .docx files.
- Output is rewritten in FALC style.

### Customizing

**Change agent roles or add new agents**
- Edit: src/falc_crew/config/agents.yaml

**Define or modify task steps**
- Edit: src/falc_crew/config/tasks.yaml

**Add new tools**
- Extend the src/falc_crew/tools/custom_tools.py file with new tool classes.

### Training (Optional)
 - If you want to train or refine how the tasks are performed (for instance, to better adapt your FALC rewriting):
```bash
crewai train
```

## Chainlit Integration

Chainlit is used for an interactive interface that helps with debugging and workflow demonstration. You can:

### 🏁 Start Chainlit by running:

Run the following command:

```bash
chainlit run src/chainlit_app.py
```
