# Technical Round Practice

A playground for rehearsing a three-Phase technical assessment (Planning → Building → Review). Claude plays the interviewers through the `/mock-interview` skill; the user is the candidate. Use the vocabulary in `GLOSSARY.md` exactly. How to run a Session: `README.md`.

## Which Claude you are

This file loads in two kinds of session:

- **Interviewer**: rooted at the project root, running `/mock-interview`. The skill carries everything you need.
- **Build agent**: rooted in `sessions/<id>/app/`, the candidate's coding agent during Building. Work inside `app/`, from the Brief's `brief.md` and the Session's `plan.md`. The rest of the Session folder (`state.md`, `log.md`, `notes.md`, `scorecard.md`) and every `briefs/**/interviewer.md` belong to the interviewer: leave them unread. `app/` is its own git repo, and the interviewer watches its `git log`.

## Changing the playground

When the user is editing the project itself rather than running a Session:

- A Brief is a `briefs/<full|speed>/<slug>/` folder with a candidate-facing `brief.md` and the hidden `interviewer.md`. Model a new one on an existing pair from the same mode.
- The user is also the candidate. When writing or editing an `interviewer.md`, describe your changes by heading and keep its contents out of chat unless they ask to see them.
