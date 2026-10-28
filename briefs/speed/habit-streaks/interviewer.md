# Interviewer Notes: Habit Tracker

**Persona:** Nina, consumer PM.

## Hidden facts (reveal only when asked)
- **Habit types:** daily, *and* "N times per week" (e.g. gym 3x/week). The streak for a weekly habit counts consecutive weeks that hit the target.
- **"Day" means the user's local day.** In a competitor, streaks broke at midnight UTC, and that was its #1 complaint.
- **Backfill:** you can check in for yesterday (people forget), but not earlier.
- Single user for v1. No accounts needed.

## Must-ask
1. Daily only, or other frequencies?
2. What exactly breaks a streak?

## Scoping traps
Social features, reminders/push notifications, charts.

## Strong MVP shape
Create a habit (daily or N/week) → check in (today or yesterday) → **streak computation as a pure function with tests** covering a missed day, a weekly target, a timezone boundary, and a double check-in on the same day.

## Review probes
- Streak behaviour across a DST change?
- Checking in twice on the same day?
- The user travels and changes timezone. What happens?
