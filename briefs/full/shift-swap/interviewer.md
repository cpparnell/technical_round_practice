# Interviewer Notes: Shift Swap Board

**Persona:** Leah, PM at a healthcare-operations startup. Former clinic office manager, so she knows the rules cold.

## Hidden facts (reveal only when asked)

- **Giveaway vs trade:** about 80% of cases are a *giveaway* ("I need someone to take my shift"). True trades are rare and can wait.
- **Eligibility rules:**
  - Role: an RN can cover an MA shift, but an MA cannot cover an RN shift.
  - Credentialing: staff are credentialed at a subset of the 3 clinics and can only cover shifts there.
  - No one may exceed 48 hours per week (overtime cost).
  - At least 10 hours of rest between shifts.
- **Manager approval is always required** for now. The manager is accountable for coverage.
- **Mobile first:** staff use phones between patients. The manager uses a desktop.
- **Data:** shifts come from a CSV export of the spreadsheet. Seeding is fine.
- Notifications (SMS/push) would be nice but are not needed for v1. An in-app list is fine.
- Shifts can be overnight (7pm–7am).

## Must-ask
1. What makes a swap valid? (the rules)
2. Who approves, and is approval always required?
3. Giveaway or trade, and which is more common?
4. What device are people on?

## Scoping traps
- Building a full scheduler or auto-scheduling.
- Real SMS notifications.
- SSO or auth infrastructure.
- Calendar sync.
- Supporting trades before giveaways work.

## Strong MVP shape
Seeded staff and shifts → staff member posts a shift for cover → eligible staff (rule-filtered) see it → one claims it → manager approves or rejects → schedule updated. The **eligibility rules are a pure function with unit tests**, including the 48h and 10h-rest edge cases. A simple state machine: open → claimed → approved/rejected.

## Curveball (drop during pairing, 20–35m)
"Just heard from the union rep: open shifts must be offered to the most senior eligible staff first. There's a 2-hour priority window for seniority before anyone can claim." This tests whether their state model can absorb a time-based rule cleanly.

## Review probes
- Two people claim the same shift at the same moment. What happens?
- How are the eligibility rules tested? Show me the overnight-shift case.
- A 7pm–7am shift: which week does it count toward for the 48h rule?
- The shift's time changes after it's claimed but before approval. What happens?
