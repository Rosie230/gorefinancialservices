# Manual Test Cases

## Phase 1 And 2

1. Open the local Jekyll site and verify the primary navigation appears on every page.
2. Confirm `Home`, `Services`, `About`, `Insights`, and `Contact` links all resolve without 404 errors.
3. Resize to a mobile viewport and verify the menu button opens and closes the mobile navigation.
4. Confirm the footer renders the same structure on every page and uses the legal links from the shared data file.
5. Open the 404 page directly and verify the brand styling is preserved.

## Phase 3 Through 5

1. Confirm the homepage, about page, and services page all reuse shared section patterns instead of unique duplicated markup.
2. Verify service cards render from `_data/services.yml` and update consistently if one service title changes.
3. Verify the values section renders all entries from `_data/values.yml` on desktop and mobile layouts.
4. Confirm no root-level site pages or shared includes reference prototype-hosted Google image URLs.
5. Confirm the contact page uses the shared contact form include and links to the privacy page.
