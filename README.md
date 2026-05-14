# Gore Financial Services Website

This repository contains the GitHub Pages version of the Gore Financial Services corporate site.

## Stack

- Jekyll layouts and includes
- Tailwind via CDN with centralized design tokens
- Static hosting on GitHub Pages
- Shared data files for navigation, footer content, services, values, and launch settings

## Key Folders

- `_layouts/` for shared page shells
- `_includes/` for reusable sections
- `_data/` for content and site settings
- `assets/` for CSS, JavaScript, icons, and self-hosted images
- `legal/` for privacy and terms pages
- `qa/` for manual test cases
- `scripts/` for repo validation

## Local Preview

If Jekyll is installed locally, you can preview the site with:

```powershell
jekyll serve
```

If Jekyll is not installed, install Ruby, Jekyll, and Bundler first, then run the same command from the repository root.

## Validation

Run the repository validation script before pushing major changes:

```powershell
pwsh ./scripts/validate-static-site.ps1
```

The script checks for:

- placeholder `href="#"` and `action="#"` values in production files
- prototype-hosted Google image URLs in the production site
- a missing form endpoint warning in `_data/site_settings.yml`

## Deployment

Deployment is handled by GitHub Actions in `.github/workflows/pages.yml`.

Before the site is considered launch-ready, set these values in `_data/site_settings.yml`:

- `url`
- `baseurl` if the site is published below a subpath
- `form_endpoint`
- final business contact details if they are added to the site

## Notes

The original Google Stitch prototype folders are intentionally preserved as source references but excluded from Jekyll build output.
