# Interviewer Notes: Feature Flag Service

**Persona:** Jordan, PM for the internal developer platform. Was on call for the incident that motivated this.

## Hidden facts (reveal only when asked)

- **#1 use case: kill switch.** Turn a misbehaving feature off in seconds without a deploy.
- **Flag types needed:** boolean on/off; percentage rollout that is **sticky** (the same user always lands in the same bucket); targeting by attribute (e.g. `plan = enterprise`, `email ends with @ourco.com`).
- **Evaluation is per request and latency-critical.** A network call per evaluation is unacceptable. Services need a client/SDK that caches rules and evaluates locally.
- **Availability:** if the flag service is down, services must keep working on last-known rules or defaults. The flag service must never cause an outage.
- **Audit log:** who changed what, when. Needed for incident postmortems.
- **Change propagation:** under ~30 seconds is fine.
- Services are in mixed languages, but one SDK in their stack is fine for v1.

## Must-ask
1. How do services consume flags? (latency, availability)
2. What kinds of flags/rules are needed?
3. Who changes flags, and is an audit trail required?
4. How fast do changes need to propagate?

## Scoping traps
- A polished admin UI first.
- Multi-environment/project hierarchy.
- Experimentation and analytics (A/B stats).
- RBAC.
- Streaming infrastructure (websockets/SSE) when polling suffices.

## Strong MVP shape
Flag CRUD API with an audit log → an **evaluation library as a pure function** (deterministic hash bucketing of flag key + user ID, rule matching) with tests → a client SDK that polls and caches rules, evaluates locally, and falls back to defaults on cold start or outage → a minimal admin page or CLI.

## Curveball (drop during pairing, 20–35m)
"Leadership after last night's incident: someone flipped a prod flag by accident. Any flag tagged `critical` now needs a second person's approval before a change takes effect." Tests whether flag changes are modelled as proposals/state transitions or as direct writes.

## Review probes
- Show me bucketing determinism and distribution (10k users at 10% gives about 1,000?).
- Ramp from 10% to 20%: do the original 10% stay in? Why?
- What's the staleness window, and what happens at SDK cold start with the service down?
- How is the audit log protected from edits?
