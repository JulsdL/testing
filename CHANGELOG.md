# Changelog

## [0.1.2] - 2025-10-2

### Added
- **Strict 'No Duplicates or Omissions' Rule:**
  In the `tasks.yaml` instructions, translators must now ensure that no information is duplicated or omitted during FALC simplification.
- **Positive & Consistent Language Editorial Guidelines:**
  - Mandated use of positive phrasing and disallowing the start of a sentence with "Ou", "Alors", "Donc", or "Si" (except for "Question ? Alors..." structure).
  - Prohibition against repeating the subject of the letter in the first sentence.
  - Extension and clarification of isosemie (consistent vocabulary) – when a word is chosen for a concept, synonyms cannot be used elsewhere in the document.
  - Expanded on the "no end-of-document summaries" rule.
- **Checklist Enhancement:**
  - Ensured conditionnel/subjunctive moods and "si" clauses without the proper conversion are disallowed.
  - Must avoid duplicated information and guarantee professional-level grammar.

### Changed
- **Unified Table Simplification Rule with Icon Prepending:**
  - When a question is followed by an answer (or answers), all content must be turned into a single-column table.
  - The question becomes the table title, answers become table rows, and column headers are always hidden (`hide_column_headers: true`).
  - For each table row, applicable icons must be prepended to the answer using placeholder syntax (e.g., `[[ICON:...]]`), with new concrete example templates included for clarity.
- **Expanded Table Transformation Examples and Procedures:**
  - Added methodology and explicit step-by-step process, covering single-answer and list-based tables, as well as how to insert tables and placeholder references.
- **Improved Phrasing in Task and Agent Instructions:**
  - All grammar, syntax, and style instructions in `tasks.yaml`, `agents.yaml`, and `falc_guidelines.md` have been revised for clarity, scope, and precision.
  - Agent instructions now specify: always use active voice; one idea per sentence; maintain grammatical correctness even when simplifying.

### Fixed
- **Potential Save Error in Code:**
  - `custom_tool.py` now raises a clear error if `original_file` is `None` before attempting to save, preventing silent file output errors.

### Improved
- **Code Type Annotations and Null Safety (`custom_tool.py`):**
  - Added explicit type annotations for OpenAI chat message parameters.
  - Streamlined response handling to ensure that the output is never null/None.
- **Table Rendering Workflow:**
  - When rendering a table, if it has a title, the code now clears the formatting of the relevant paragraph, inserts the title with icons, and sets additional spacing for professional appearance.

### Documentation
- **FALC Editorial Guide Updates:**
  - `falc_guidelines.md` now in line with the expanded style and content rules from `tasks.yaml`.
  - Examples for positive phrasing, isosemie, and forbidden sentence starters have been added for extra clarity.

## [0.1.1] - 2025-07-11

### Changed
- **FALC Translation Task**:
  - Enforced absolute information preservation: every fact, date, amount, condition, proper name, address, and obligation from the original text must be present in the FALC version.
  - Added explicit instructions to consult and apply all rules from the 'Règles d'édition FALC', including special handling for conditional sentences.
  - Introduced a verification checklist and a final review step using the 33-point FALC checklist to ensure completeness and compliance.
- **Table Optimizer Task**:
  - Generalized table detection and creation: now supports a wider range of table types (comparisons, lists, schedules, contacts, etc.), not just fixed patterns.
  - Clarified and strengthened rules for reconstructing 'body_sections' to ensure all original content is preserved and table placeholders are inserted in the correct order.
  - Added new example for schedule tables and clarified when not to create tables (e.g., for single-row/column data).
  - Improved icon handling and clarified removal of markdown table formatting.
- **Knowledge Base (FALC Guidelines)**:
  - Updated the verification checklist from 51 to 33 criteria, reorganized and clarified requirements for word choice, numbers, dates, sentence structure, document structure, lists, formatting, and icon usage.
- **Agent Configuration**:
  - Strengthened FALC Translator and Table Optimizer roles to emphasize information preservation, clarity, and correct removal of original text once tabularized.
- **Custom Tools**:
  - Improved WordExtractorTool to extract text from both paragraphs and tables, ensuring all content is included.
  - Enhanced FalcDocxStructureTaggerTool to predict document type and provide more detailed instructions for identifying main content boundaries.
- **Other**:
  - Reduced default number of training iterations from 3 to 2 in `main.py`.
  - Updated user-facing message in Chainlit app to indicate processing may take approximately 2 minutes instead of 1.

## [0.1.00] - 2025-05-09

## Added

- Authentication against Azure AD
- Container with docker-compose and traeffik to manage access to frontends
- Add /admin/ to manage access to to user's rights on app
- Merge branch "pierre" into main
- Code cleanup
- First deploy on server

## [0.0.10] - 2025-04-28

## Added

- Introduced table support in FALC document processing, allowing for structured content detection and insertion of tables.
- Implemented a table optimizer agent to enhance document clarity by restructuring content into tables.
- Trained the Crew on 3 models.

## Changed

- Updated document rewriting logic to replace specific sections with FALC translations, including tables.
- Refined FALC guidelines and configuration for improved document translation and formatting.
- Updated Crew training logic in main.py.

## [0.0.9] - 2025-04-22

## Added

- Introduced Dockerfile for containerization of the application.
- Added French translations for the Chainlit interface.
- Included new dependencies in the project configuration.

## Changed

- Updated icon paths in the knowledge base configuration from /knowledge to /data
- Enhanced the welcome message with additional instructions for document submission.
- Modified environment variable handling for Langfuse host configuration.

## [0.0.8] - 2025-04-16

## Added

- Added LLM observability with Langfuse and Open Telemetry.
- Introduced new Chainlit translations for french

## Changed

- Updated import statements and configuration files to support new language translations.

## [0.0.7] - 2025-04-15

## Changed

- Updated the training function to use a real document for input and added user prompts for file selection.
- Improved error handling and logging during the training process.
- Removed unused imports to streamline the codebase.

## [0.0.6] - 2025-04-15

## Changed

- Refactored the main execution flow to use asynchronous steps with Chainlit for improved document processing.
- Added user feedback mechanism with Chainlit Steps to indicate progress during document processing.
- Removed unused custom tool code and streamlined tool implementations.

## [0.0.5] - 2025-04-15

## Added

- Implemented session-based isolation for file uploads and outputs using unique session IDs.
- Enhanced the document processing pipeline to support session-specific output directories.

## Changed

- Updated the document processing workflow to handle output files dynamically based on session context.

## [0.0.4] - 2025-04-14

## Added

- Introduced FalcDocxStructureTaggerTool and FalcDocxRewriterTool for tagging and rewriting .docx files.
- Enhanced functionality to update original Word documents with translated content while preserving layout.

## Changed

- Updated task configuration to support rewriting original documents instead of generating new ones.

## [0.0.3] - 2025-04-14

### Added

- Introduced functionality to scan text for icon placeholders and insert corresponding EVAM PNG images in Word documents.
- Updated icons.json with new company-defined icons and paths.
- Enhanced translation task to utilize icon placeholders instead of emojis.

### Changed

- Modified translation task instructions to prohibit the use of emojis and enforce the use of icon placeholders.
