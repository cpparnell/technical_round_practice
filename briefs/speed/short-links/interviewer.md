# Interviewer Notes: Short Links

**Persona:** Tom, marketing ops lead.

## Hidden facts (reveal only when asked)
- **Custom slugs matter** (`/spring-sale`) for printed flyers. Random slugs are fine otherwise.
- **Stats:** total clicks plus clicks per day. That's it.
- Internal tool, so no auth for v1.
- Links shouldn't be editable once printed. Changing the destination is a nice-to-have for typos.

## Must-ask
1. Custom slugs or random?
2. Which stats, exactly?

## Scoping traps
QR codes, geo/device analytics, user accounts, link expiry.

## Strong MVP shape
Create (validate URL, custom or random slug, collision check) → redirect with a **302** and record the click → stats page (total, per day). A test covers slug collision and redirect.

## Review probes
- 301 vs 302? (A 301 gets cached by browsers, so repeat clicks go uncounted.)
- What does a `javascript:` URL or a URL to your own domain do?
- Two people create the same custom slug at once?
