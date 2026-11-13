# Technical Round Practice

Mock runs of a three-Phase technical assessment (Planning → Building → Review), with Claude playing the interviewers. Terms are defined in [GLOSSARY.md](GLOSSARY.md).

## Run a Session

From this directory, in Claude Code:

```
/mock-interview full [slug]     # ~3h55m: 45m plan, 100m build, 30m review, plus two breaks
/mock-interview speed [slug]    # ~1h: 10m plan, 40m build, 10m review
/mock-interview resume [id]     # pick up an unfinished Session, even from a new conversation
```

- **Build in a second terminal**, running your coding agent inside `sessions/<id>/app/`. Commit often, since the interviewer watches `git log`.
- **Pause and resume in the interviewer session:** say `pause` / `back`.
- **A ding** (the first `media/*.mp3`, falling back to Glass.aiff) plays each time the interviewer finishes a turn, but only in this directory and while a Session is in progress. The script is `.claude/hooks/interviewer-ding.sh`. Disable it with `/hooks`.

## Honour system

Don't open any `briefs/**/interviewer.md` file. Those are the hidden Interviewer Notes. Don't expand the interviewer's Read output of them either.

## Layout

- `briefs/full/`: 6 full-length Briefs
- `briefs/speed/`: 6 simpler Briefs
- `sessions/`: one folder per Session (`state.md`, `log.md`, `plan.md`, `notes.md`, `scorecard.md`, `app/`), plus `INDEX.md` (created from `INDEX.template.md` on first run). Everything under `sessions/` except the template is gitignored.
- `.claude/skills/mock-interview/`: the interviewer skill
