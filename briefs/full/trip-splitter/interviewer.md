# Interviewer Notes: Group Trip Expenses

**Persona:** Sam, consumer product PM. Travels a lot with friends and has strong opinions.

## Hidden facts (reveal only when asked)

- **Target groups:** 4–12 people on a 3–10 day trip.
- **Uneven splits are common:** not everyone eats every dinner, and some people don't drink. Expenses need to split across a *subset* of members. Custom shares are a nice-to-have.
- **Multiple currencies are the #1 pain** on international trips. Settle in one home currency per trip. A fixed exchange rate entered or captured at expense time is fine; no live FX dependency is needed.
- **Settle-up output:** a list of "A pays B $X" transfers. Fewer transfers is better.
- **No accounts:** share a trip link and pick your name. Trust within the group.
- **Edits happen** (wrong amount, wrong payer). People want an **edit history**, so nobody suspects tampering.
- **Money must be exact.** Split $10 three ways and the remainder can't vanish. Balances must sum to zero.

## Must-ask
1. How are costs split? (subsets, uneven)
2. Currencies?
3. How do people join?
4. What does "settle up" actually produce?

## Scoping traps
- Real payments (Venmo, Stripe).
- Receipt OCR.
- A login and account system.
- A live FX API as a hard dependency.

## Strong MVP shape
Create a trip with members → add an expense (payer, amount, currency + rate, split among a subset) → balances view → minimal-ish transfer list. **Ledger math lives in a pure, tested module** using integer minor units, with an invariant test that balances sum to zero and an explicit rounding policy.

## Curveball (drop during pairing, 20–35m)
"User research came back: people constantly settle *partially* during the trip ('I Venmo'd you $40 for the Uber'). They want to record payments between members, and those should update balances." Tests whether the ledger model treats payments as first-class transactions.

## Review probes
- Show me the sum-to-zero invariant test. What does $10 split 3 ways produce?
- What happens when you remove a member who has expenses?
- Is your settle-up algorithm optimal? (Minimising transfers is NP-hard in general. Do they know greedy is an approximation, and that it's fine?)
- How is the edit history stored, and can it be tampered with?
