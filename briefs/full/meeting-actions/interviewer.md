# Interviewer Notes: Meeting Follow-Through

**Persona:** Marcus, PM for internal tools. Ran a failed pilot of this idea last quarter and is wary.

## Hidden facts (reveal only when asked)

- **Users:** engineering managers running recurring meetings (weekly team syncs, 1:1s).
- **Core pain:** at the *next* meeting, nobody remembers what was committed. They want last meeting's open items shown at the start of the next one ("carry-forward" across a recurring series).
- **Why the last pilot failed:** the LLM invented owners and attributed items to people who weren't in the meeting. Owners **must** come from the attendee list. If there's no clear owner ("someone should look at that"), mark it **unassigned**; never guess.
- **Due dates** are usually relative ("by Friday", "next sprint") and must be resolved against the meeting date. If there's no date, leave it blank.
- **Transcript size:** 30–60 minute meetings, roughly 8–15k tokens.
- Managers want to **review and edit** extracted items before they're saved. They trust it more that way.
- Integrations (Slack, Jira, calendar) are explicitly out of scope for v1.

## Must-ask
1. Who uses it, and when?
2. What happens after extraction? (tracking over time, not a one-shot summary)
3. How do items relate across meetings? (the recurring series)
4. What went wrong before / what accuracy is acceptable?

## Scoping traps
- Building recording or transcription.
- Slack, calendar, or Jira integrations.
- A full task manager (comments, subtasks, notifications).
- Summarising the whole meeting.

## Strong MVP shape
Paste transcript + attendee list + meeting date → structured extraction (task, owner ∈ attendees or "unassigned", resolved due date, **verbatim source quote**) → review/edit screen → series view showing open items carried forward, mark done. Verification: owner-in-attendees check and quote-exists-in-transcript check in code; a few hand-labelled transcripts as an eval.

## Curveball (drop during pairing, 20–35m)
"Legal just weighed in: we can't store full transcripts longer than 24 hours. Only the extracted items and their source quotes can persist." Watch how they adjust the data model and whether they consider what that does to re-processing and auditability.

## Review probes
- What if the source quote doesn't appear verbatim in the transcript?
- What if a transcript exceeds the context window?
- The same item is mentioned twice in one meeting. What happens?
- The meeting is on a Tuesday and someone says "by next Tuesday." What date do you store?
- How do you know the extraction is good? Show me.
