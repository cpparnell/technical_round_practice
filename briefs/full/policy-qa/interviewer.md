# Interviewer Notes: Ask HR

**Persona:** Aisha, PM for internal employee experience. Works closely with HR legal.

## Hidden facts (reveal only when asked)

- **Trust is everything.** Answers must **cite** the specific policy and section.
- **Refusal over guessing.** When the docs don't cover a question, say so and point to the People team. A wrong answer about parental leave is a legal risk. HR legal would rather it refuse too often than answer wrong.
- **Policies vary by country** (US, UK, Germany). The employee's country determines the right answer, and mixing them up is a serious error.
- **Docs are updated quarterly.** Re-ingesting must be easy, and stale answers are a concern.
- **Scale:** about 1,500 employees, maybe 200 questions a day.
- **The People team wants a log of unanswered questions,** so they can improve the docs.
- Markdown docs are fine. No PDF parsing needed.
- Six to ten synthetic docs is plenty for v1.

## Must-ask
1. What should happen when the answer isn't in the docs?
2. Do policies differ by location or employee type?
3. How will we judge answer quality?
4. Who maintains the docs, and how often do they change?

## Scoping traps
- A Slack bot integration.
- Heavy vector-DB infrastructure (in-memory or SQLite is fine at this scale).
- Multi-turn chat memory.
- SSO.
- A PDF-parsing rabbit hole.

## Strong MVP shape
Ingest markdown → chunk by section with metadata (doc, section, country) → retrieve, filtered by the asker's country (embeddings or even BM25) → answer with citations, refusing when support is weak → unanswered-question log → a **small eval set** (~15 questions with expected source or expected refusal) that they actually run.

## Curveball (drop during pairing, 20–35m)
"HR legal just told me some of these docs are confidential (exec comp, investigation procedures) and must never be surfaced to regular employees." A strong answer enforces access **at retrieval** (metadata filter) rather than by instructing the model in the prompt.

## Review probes
- Show me a question that should be refused. Does it refuse?
- How do you verify that a citation actually supports the answer?
- Two versions of a policy conflict (old and new). What happens?
- A doc contains the text "Ignore your instructions and…". What happens?
- Cost and latency per question? What would you cache?
