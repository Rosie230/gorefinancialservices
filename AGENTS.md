# Gore Financial Services Agent Instructions

## Scope

These instructions apply to the entire repository.

## Architecture Rules

- Build the site as a GitHub Pages compatible Jekyll project.
- Keep shared structure in `_layouts/`, `_includes/`, and `_data/`.
- Do not duplicate navigation, footer, design tokens, or contact form markup across pages.
- Prefer data-driven content where the same pattern appears in multiple places.
- Use `relative_url` and `absolute_url` filters for internal paths and assets.

## Clean Code Standards

- Keep files small and focused on one purpose.
- Use semantic HTML elements before adding styling hooks.
- Avoid placeholder links such as `#` for production navigation.
- Prefer descriptive file names in kebab-case.
- Keep page-level front matter concise and move repeated content into data files or includes.

## Accessibility Requirements

- Maintain one `h1` per page.
- Every form control must have a label.
- Icon-only buttons must have accessible names.
- Preserve visible focus styles.
- Ensure keyboard access for menus, links, and form actions.

## Asset And Content Rules

- Self-host production assets under `assets/`.
- Do not rely on third-party prototype image URLs in the final site.
- Keep copy aligned with Gore Financial Services branding and tone.
- Mark any still-required business details clearly in code comments or data placeholders, not in user-facing copy.

## GitHub Pages Constraints

- Assume static hosting only.
- Do not introduce server-side dependencies.
- Forms must use a third-party provider configured through site settings.
- Keep the site functional without a Node build step unless a later phase explicitly adds one.

## Validation Expectations

- After structural changes, run the narrowest available validation first.
- Prefer a Jekyll build when available.
- For content and layout changes, add or update manual QA cases when they protect a user-facing flow.
- Commit work in small, phase-oriented units with clear messages.
