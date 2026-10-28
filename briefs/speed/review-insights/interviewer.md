# Interviewer Notes: Review Insights

**Persona:** Elena, PM for the mobile app. Has a roadmap review on Friday.

## Hidden facts (reveal only when asked)
- **The decision it informs:** which 2–3 problems to put on next quarter's roadmap.
- **Desired output:** themes with counts, average stars, and 2–3 **verbatim** representative quotes. Not per-review sentiment.
- **Themes must be consistent.** Running it twice shouldn't produce different theme names. (Hint: have the LLM propose a fixed taxonomy from a sample, then classify into it.)
- Star rating already gives sentiment, so don't re-derive it.
- About 10% of reviews aren't in English.
- 500 reviews is cheap, but batch them.

## Must-ask
1. What decision will this inform?
2. What should the output look like?

## Scoping traps
Live scraping of app stores, chart-heavy dashboards, fine-grained sentiment scoring.

## Strong MVP shape
Load CSV → LLM proposes 6–10 themes from a sample → classify every review into that fixed set, in batches, with structured output → report: theme, count, average stars, verbatim quotes (checked to exist in the source) → spot-check accuracy on about 20 reviews by hand.

## Review probes
- Run it twice. Same themes, same counts?
- How did you check the classification is right?
- One batch fails or returns malformed output. What happens?
- Are the quotes really verbatim?
