# Interviewer Notes: Recipe Scaler

**Persona:** Rosa, PM at a cooking app.

## Hidden facts (reveal only when asked)
- **Input is messy free text:** "a pinch of salt", "1 1/2 cups flour", "2 (14 oz) cans tomatoes", "salt to taste".
- **Some things don't scale:** "to taste" and "a pinch" stay as-is.
- **Display matters:** show "1/3 cup", not "0.333 cup".
- An earlier prototype let the LLM do the math and got wrong quantities about 1 time in 20. That's unacceptable.
- Metric conversion is a stretch goal.

## Must-ask
1. What does the input look like?
2. Is there anything that shouldn't scale?
3. How accurate does it need to be?

## Scoping traps
Saving recipes or a recipe database, a full unit-conversion system, importing from images or URLs.

## Strong MVP shape
Paste → the LLM **only parses** into a schema-validated `{qty, unit, item, note}` → **deterministic code scales** the quantities and formats fractions → original vs scaled shown side by side. Tests cover the scaler and the formatter.

## Review probes
- Why not let the LLM scale? (Expect them to cite the 1-in-20 error.)
- How do you handle LLM output that fails schema validation?
- Scale "2 (14 oz) cans" by 1.5. What comes out?
