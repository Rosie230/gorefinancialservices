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

## Phase 6 Through 10

1. Confirm the contact form renders the configured provider path when `_data/site_settings.yml` includes a real `form_endpoint`.
2. Verify the privacy and terms pages contain structured legal sections and are linked from the footer.
3. Confirm the page source includes a canonical URL, Open Graph metadata, and favicon reference.
4. Request `/robots.txt` and `/sitemap.xml` from the built site and verify they render correctly.
5. Run `scripts/validate-static-site.ps1` and confirm it reports no placeholder links or prototype-hosted assets in production files.
6. In GitHub Actions, verify the Pages workflow runs validation before build and deploy.

## Local Review Workflow

1. Create and activate the Conda environment from `environment.yml` inside WSL.
2. Run `gem install bundler` followed by `bundle install` from the repo root.
3. Start the site with `bundle exec jekyll serve --livereload --host 127.0.0.1 --port 4000`.
4. Verify the site loads locally and page navigation works without layout regressions.
5. Run `bundle exec jekyll build` before ending the review pass.
6. If a form endpoint has been configured, submit a test enquiry and confirm the provider receives it.


