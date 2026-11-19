# Uploads & downloads

Client checks are **UX**; [OWASP File Upload](https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html) requires server validation.

## Before upload (FE)

| Check | Notes |
| ----- | ----- |
| Max size from binding | Reject early with clear message |
| Allowed MIME/extension list | Match server — do not trust `file.type` alone |
| Image preview | Use `object URL` for display; never `innerHTML` file content |
| Multiple files | Cap count per binding |

## Upload transports

| Pattern | FE notes |
| ------- | -------- |
| Multipart to API | Include auth + CSRF per binding |
| Presigned PUT to storage | CSP `connect-src` must include storage origin ([csp-and-headers](csp-and-headers.md)) |
| Chunked / resume | Same auth scope per chunk |

Do not embed API keys for storage in the bundle — presign via backend.

## Dangerous types

Reject UX for executables, HTML, SVG-with-script when product does not need them (server still scans).

Zip bombs / huge archives: client size cap; server enforces stricter limit.

## Downloads

- Prefer `Content-Disposition: attachment` from API for exports.
- For blob downloads in FE, set filename from server-provided safe name — not raw user string without sanitizing path segments.

## `@fe-forms`

File inputs in create/edit flows: show validation errors from API; disable submit while uploading when mutation must be atomic.