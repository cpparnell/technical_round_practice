# Interviewer Notes: Launch Waitlist

**Persona:** Kai, founder.

## Hidden facts (reveal only when asked)
- **Position rule:** signup order, minus 5 spots per *successful* referral. Never above #1.
- **A referral counts only when the friend confirms their email.** Simulating confirmation (log the link) is fine.
- **Fraud seen in beta:** people referring themselves with `name+1@gmail.com`, `name+2@...`. Emails must be normalised.
- After signup, show the person their position and referral link. They can check status later.
- An admin needs a CSV export.

## Must-ask
1. How exactly do referrals move you up?
2. What counts as a referral?
3. Any abuse concerns?

## Scoping traps
Real email sending, landing-page design, analytics.

## Strong MVP shape
Signup (normalise email, reject duplicates) → referral code/link → simulated confirm → **position computed by a pure, tested function** → status page → CSV export.

## Review probes
- Is the position computed or stored? What happens to everyone else when one person moves up?
- Ties?
- Gmail dots (`j.ohn@gmail.com`) and `+tags`: what's your normalisation rule?
- Two signups in the same millisecond?
