# Key workflow

- One namespace per product module when possible.
- Prefer reusing existing keys over synonyms (`save` vs `submit` — pick one per module).
- Pluralization: use ICU / library plural rules; no string concat for counts.
- Interpolation: name variables `{userName}`; escape user content.