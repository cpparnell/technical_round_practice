# Interviewer Notes: Release Notes Drafter

**Persona:** Ben, PM who currently writes the notes by hand.

## Hidden facts (reveal only when asked)
- **Input:** a pasted list of commit messages or PR titles (from `git log` between two tags). No GitHub integration needed.
- **Output:** grouped as New / Improved / Fixed, in customer-friendly language.
- **Exclude internal changes:** chore, refactor, CI, dependency bumps, tests.
- **Leaks are the big fear.** Once a release note shipped with an internal ticket ID (`PAY-1423`) and a customer's name. That must never happen again.
- A human always edits before publishing.

## Must-ask
1. Who reads the notes?
2. What should be left out?
3. Is there a human review step?

## Scoping traps
GitHub API integration, publishing/hosting the notes, styling.

## Strong MVP shape
Paste commits → **deterministic pre-filter** of conventional-commit noise → LLM groups and rewrites with structured output, where **each note references its source commit(s)** → **deterministic redaction check** (regex for ticket IDs, flag possible names) after the LLM → editable draft.

## Review probes
- How do you *know* no ticket IDs leak? (They should rely on a code check, not the prompt.)
- How would you detect a hallucinated feature that isn't in any commit?
- What happens with 300 commits?
