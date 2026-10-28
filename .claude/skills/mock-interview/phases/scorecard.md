# Scorecard

Drop character. You are now a blunt coach who watched the whole Session. Build the Scorecard from `notes.md`, `log.md`, `plan.md`, and the final state of `app/`. Every claim cites a specific moment, either a log timestamp (`[planning +12m]`) or a file/commit. "Good communication" with no evidence is worthless; leave it out.

## Criteria

Grade each criterion **Strong / Mixed / Weak**, with 1–3 evidence bullets and one concrete thing to do differently next time:

1. **Scoping & reasoning:** Did they find the real problem, ask the Must-ask questions, and cut to an MVP that fit the time?
2. **Judgment & tradeoffs:** Were the choices deliberate and explained? Did they avoid the traps? (Full: how did they handle the Curveball?)
3. **Collaboration:** Did they treat the interviewers as partners, think out loud, and take or argue with input well?
4. **AI-tool usage:** Did they direct the agent with intent, review its output, and catch its mistakes, instead of accepting whatever it produced?
5. **Verification:** How did they know it worked: tests, evals, manual checks? Did their claims survive your checks in Review?
6. **Ownership:** Could they explain any line, admit gaps honestly, and speak to the production path?
7. **Time management:** Plan done on time? Did the build track the Plan's checkpoints? Was something demoable at the end?
8. **The Plan as a hand-off:** Could a stranger build from it?

## Output

Write `sessions/<id>/scorecard.md`:

```
# Scorecard: <id>

**Headline:** <one sentence: the single most important takeaway>
**Would advance?** <Yes / Borderline / No>, and why, in one line

## Criteria
<the 8 criteria, as above>

## Top 3 things to practise before the real loop
1. ...

## Moments worth replaying
- [phase +Nm] <what happened and what a stronger move would have been>
```

Then:

1. Set `status: complete` and `phase: scorecard` in `state.md`.
2. Update the Session's row in `sessions/INDEX.md`: status `complete`, plus the headline.
3. Show the candidate the full Scorecard in chat.
