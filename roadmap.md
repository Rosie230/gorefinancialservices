# Gore Financial Services Website Roadmap

## Purpose

This document defines the work required to turn the current Google Stitch prototype files into a maintainable, production-ready website for Gore Financial Services.

The target deployment model is:

- Static hosting on GitHub Pages
- Jekyll for layouts, includes, and page structure
- A shared design system derived from the existing Mastercard-inspired design direction
- A small, launchable MVP first, followed by post-launch enhancements

This roadmap is intentionally explicit. The current repository contains good design references, but it does not yet contain a complete website, a publishable structure, or production-safe content and assets.

## Current State Summary

The repository currently contains three primary HTML prototypes and one design reference:

- `gore_financial_services_updated_homepage/code.html`
- `gore_financial_services_about_us/code.html`
- `gore_financial_services_contact_form/code.html`
- `gore_financial_service_mastercard_inspired_style/DESIGN.md`

These files are useful as design source material, but they are not production-ready for the following reasons:

- Navigation and footer structures are duplicated across pages.
- Internal links are placeholders rather than real routes.
- The contact form has no working submission path.
- The pages depend on external imagery that should not be treated as long-term production assets.
- The repository does not yet have a root publishing structure for GitHub Pages.
- Launch-critical pages such as privacy, terms, and 404 are missing.
- There is no build or validation pipeline.

## Website Goal

Create a polished marketing and lead-generation website for Gore Financial Services that:

- Presents the firm as professional, modern, and trustworthy
- Reuses the best elements of the three existing prototypes
- Is easy to maintain over time
- Can be hosted reliably on GitHub Pages
- Supports a working contact flow without a custom backend
- Establishes a clean technical foundation for future expansion

## Guiding Decisions

- Brand name: Gore Financial Services
- Hosting: GitHub Pages
- Site architecture: Jekyll with shared layouts and includes
- Design direction: combine the strongest patterns from the homepage, about, and contact prototypes
- Initial launch scope: no custom domain required
- Form handling: external provider required because GitHub Pages is static-only

## Recommended MVP Scope

The first public launch should focus on a small, coherent set of pages:

1. Home
2. Services
3. About
4. Contact
5. Privacy Policy
6. Terms of Use
7. 404 page

The following can be treated as phase-two content if copy is not ready:

- Insights or Resources
- Careers
- Individual service detail subpages
- Case studies or testimonials hub

## Recommended Final Structure

The repository should evolve toward a structure like this:

```text
/
  _config.yml
  index.md
  about.md
  services.md
  contact.md
  insights.md
  404.html
  robots.txt
  sitemap.xml
  AGENTS.md
  _layouts/
    default.html
    page.html
    home.html
  _includes/
    head.html
    nav.html
    footer.html
    hero.html
    solutions-grid.html
    trust-section.html
    contact-form.html
    tailwind-config.html
  _data/
    navigation.yml
    footer_sections.yml
    site_settings.yml
  assets/
    css/
    js/
    images/
    icons/
  legal/
    privacy.md
    terms.md
```

## Prototype Reuse Strategy

The final website should not simply copy one prototype. It should combine the strongest sections from each.

### Use from the homepage prototype

Source: `gore_financial_services_updated_homepage/code.html`

- Hero structure and main visual tone
- Solutions grid or service highlights
- Primary call-to-action pattern
- General landing page pacing and section rhythm

### Use from the about prototype

Source: `gore_financial_services_about_us/code.html`

- Trust-building and value-storytelling sections
- Expertise blocks and firm credibility content
- Any sections that help position the firm as established and capable

### Use from the contact prototype

Source: `gore_financial_services_contact_form/code.html`

- Contact page layout
- Inquiry form styling
- Consultation-oriented CTA framing

### Use from the design specification

Source: `gore_financial_service_mastercard_inspired_style/DESIGN.md`

- Color system
- Typography choices and hierarchy
- Radius, spacing, and surface rules
- CTA treatment and overall design discipline

## Roadmap Phases

## Phase 1: Establish Standards And Working Rules

### Objective

Create the project rules before implementation starts so the site does not drift into duplicated or inconsistent code.

### Tasks

1. Create `AGENTS.md` at the repository root.
2. Define rules for:
   - Jekyll-first architecture
   - Shared includes and layouts
   - Avoiding duplicated navigation, footer, and theme config
   - Semantic HTML usage
   - Accessibility requirements
   - Asset ownership and file naming
   - GitHub Pages compatibility
   - Review and validation expectations
3. Decide on naming conventions for pages, includes, data files, and assets.
4. Decide how Tailwind or styling configuration will be centralized.

### Deliverables

- Root `AGENTS.md`
- Shared conventions for future implementation work

### Exit Criteria

- The repo has a clear implementation standard.
- Future contributors can build new pages without copying entire prototype files.

## Phase 2: Set Up The Publishable Site Skeleton

### Objective

Replace the current folder-of-prototypes structure with a real website shell that GitHub Pages can publish.

### Tasks

1. Add `_config.yml` for Jekyll.
2. Create `_layouts/default.html` as the shared page shell.
3. Create `_layouts/page.html` and `_layouts/home.html` if separate templates are useful.
4. Add `_includes/head.html`, `_includes/nav.html`, and `_includes/footer.html`.
5. Create root-level page entry points:
   - `index.md`
   - `about.md`
   - `services.md`
   - `contact.md`
   - `insights.md` or a placeholder if content is not ready
6. Add `legal/privacy.md` and `legal/terms.md`.
7. Add `404.html`.
8. Create `_data/navigation.yml` and `_data/footer_sections.yml`.

### Deliverables

- A Jekyll site that builds into a coherent, multi-page website
- Shared navigation and footer driven by data

### Exit Criteria

- The repo can be served as a site rather than a set of disconnected prototypes.
- Every main navigation item points to a real page.

## Phase 3: Extract Reusable Components From The Prototypes

### Objective

Turn repeated or strong design patterns into reusable components so the site is maintainable.

### Tasks

1. Extract the repeated Tailwind or theme config into one shared include.
2. Extract navigation into `_includes/nav.html`.
3. Extract footer into `_includes/footer.html`.
4. Convert the homepage hero into a reusable include.
5. Convert the service highlight or solutions area into a reusable include.
6. Convert trust-building sections from the about prototype into reusable sections.
7. Convert the contact form shell into a reusable contact-form include.
8. Move any repeated site metadata into `_data/site_settings.yml` if useful.

### Deliverables

- Shared components instead of page-level duplication
- Cleaner templates that separate structure from content

### Exit Criteria

- Shared layout elements exist once in the codebase.
- New pages can be added by composing includes rather than copying full HTML files.

## Phase 4: Create Real Page Content And Information Architecture

### Objective

Replace prototype-only structure with a real public-facing site architecture for Gore Financial Services.

### Tasks

1. Define the final navigation labels.
2. Confirm the page hierarchy.
3. Create content blocks for the homepage:
   - Hero
   - Core services overview
   - Why Gore Financial Services
   - Trust or expertise section
   - Contact CTA
4. Create content blocks for the services page:
   - Service categories
   - Audience fit
   - Process or engagement model
   - CTA to contact or schedule consultation
5. Create content blocks for the about page:
   - Firm overview
   - Experience and values
   - Leadership or team summary
   - Differentiators
6. Create content blocks for the contact page:
   - Form
   - Email and phone if available
   - Business location or service region
   - Response expectations
7. Create a minimal insights page even if detailed articles are deferred.
8. Create legal pages with real content.

### Deliverables

- Real page structure and real page purposes
- A site that can be navigated and understood by a first-time visitor

### Exit Criteria

- No core navigation link points to a placeholder.
- The site reads as a real firm website rather than a design exercise.

## Phase 5: Replace Fragile Assets And Finalize Brand Ownership

### Objective

Remove dependence on external assets and placeholder content that would create risk at launch.

### Tasks

1. Audit all image references in the prototypes.
2. Replace externally hosted design images with locally stored assets in `assets/images/`.
3. Confirm licensing or ownership for every image before launch.
4. Add optimized file formats where possible.
5. Create a favicon and site icon set.
6. Update page titles and visible brand references to Gore Financial Services.
7. Remove any residual placeholder text, dummy labels, or design-only copy.

### Deliverables

- Production-safe asset set
- Consistent branding throughout the site

### Exit Criteria

- The website does not rely on temporary third-party image URLs.
- Every visible brand reference is correct and intentional.

## Phase 6: Make The Contact Flow Actually Work

### Objective

Make the site able to capture enquiries even though it is hosted on static infrastructure.

### Tasks

1. Choose a static-site-compatible form service such as Formspree or Getform.
2. Connect the contact form to that provider.
3. Define required fields.
4. Add client-side validation.
5. Add success and error states.
6. Add a privacy disclosure explaining how submitted information is handled.
7. Confirm spam protection options if available.
8. Test the submission path end to end.

### Deliverables

- Working enquiry capture flow
- Validated contact experience for visitors

### Exit Criteria

- A visitor can submit a contact request successfully.
- The team can receive and act on submissions reliably.

## Phase 7: Accessibility, Semantics, And Content Quality Pass

### Objective

Raise the site from visually complete to professionally usable.

### Tasks

1. Ensure correct heading hierarchy on every page.
2. Ensure every form input has an associated label.
3. Ensure icon-only controls have accessible names.
4. Ensure keyboard navigation works for all interactive elements.
5. Check color contrast against WCAG expectations.
6. Add meaningful alternative text for informative images.
7. Ensure focus styles are visible.
8. Remove any unnecessary decorative noise that harms clarity.
9. Review all copy for tone, grammar, and trustworthiness.

### Deliverables

- Semantically correct and accessible markup
- Clearer, more professional content presentation

### Exit Criteria

- Core user flows are usable with keyboard navigation.
- The site meets a reasonable accessibility baseline for launch.

## Phase 8: SEO And Launch Essentials

### Objective

Add the minimum required metadata and supporting files for discoverability and professionalism.

### Tasks

1. Add unique page titles.
2. Add meta descriptions.
3. Add Open Graph metadata.
4. Add canonical URLs if the final site URL is known.
5. Add `robots.txt`.
6. Add `sitemap.xml`.
7. Add favicon references.
8. Add a social sharing image if available.
9. Ensure the 404 page is branded and helpful.

### Deliverables

- Search and social metadata across the site
- Required supporting files for launch

### Exit Criteria

- Every public page has sensible metadata.
- The site is ready to be indexed and shared.

## Phase 9: Quality Gates And Repository Automation

### Objective

Prevent regressions and make the site easier to maintain after launch.

### Tasks

1. Add a GitHub Actions workflow to build the site.
2. Add a link validation step.
3. Add formatting or linting appropriate to the chosen stack.
4. Decide whether to introduce a real Tailwind build step later.
5. If JavaScript is added, validate it with a linter.
6. Document the local preview workflow.
7. Document the deployment workflow.

### Deliverables

- Basic CI for the site
- Reduced risk of broken links or broken builds

### Exit Criteria

- A pull request can be validated automatically before merge.
- The site build is reproducible.

## Phase 10: GitHub Pages Deployment

### Objective

Publish the site and verify it behaves correctly in the hosted environment.

### Tasks

1. Choose the GitHub Pages source configuration.
2. Confirm Jekyll is building correctly on GitHub Pages.
3. Ensure all asset paths work relative to the final site URL.
4. Confirm navigation works after deployment.
5. Confirm the contact form still works from the hosted site.
6. Confirm the 404 page is served correctly.
7. Perform mobile and desktop smoke tests on the live deployment.

### Deliverables

- Live public site on GitHub Pages

### Exit Criteria

- The site is reachable publicly.
- All MVP pages load correctly in production.

## Phase 11: Post-Launch Enhancements

### Objective

Expand beyond the MVP once the base website is stable.

### Possible Enhancements

1. Add deeper service subpages.
2. Add an insights or articles section with real posts.
3. Add testimonials or case studies.
4. Add team member profile pages.
5. Add a newsletter signup flow.
6. Add analytics.
7. Add performance budgets and Lighthouse automation.
8. Add a stronger content publishing workflow.

### Exit Criteria

- Enhancements are layered on top of a stable, documented base rather than mixed into MVP delivery.

## Priority Order

If implementation starts immediately, this should be the order of execution:

1. Create `AGENTS.md`
2. Set up Jekyll structure and root pages
3. Extract shared nav, footer, and theme config
4. Build homepage from the best prototype sections
5. Build services, about, and contact pages
6. Replace images and placeholders with real assets and content
7. Connect form handling
8. Add legal, SEO, 404, robots, and sitemap
9. Add CI and deployment workflow
10. Publish to GitHub Pages

## Dependencies And Constraints

### Technical constraints

- GitHub Pages is static hosting.
- Server-side logic is not available in this repository.
- Form submissions must use an external service.
- Asset paths must work within GitHub Pages routing.

### Content dependencies

- Final service descriptions are required before the services page can be considered complete.
- Real business contact details are required before launch.
- Privacy and terms copy are required before the contact form should go live.
- Approved images or graphics are required before replacing the prototype visuals.

### Design dependencies

- The final visual system should remain consistent with the design language in `DESIGN.md`.
- Shared theme settings should be defined once and reused everywhere.

## Risks To Manage

1. Copying the prototype HTML directly into production pages will create long-term maintenance problems.
2. Leaving external prototype images in place will create reliability and ownership risk.
3. Launching without legal and privacy pages will weaken trust and may create compliance issues.
4. Launching without a tested form flow will undermine the site's main business goal.
5. Skipping accessibility and semantic cleanup will make the site look polished but behave poorly.

## Definition Of Done For MVP

The MVP should be considered complete only when all of the following are true:

- The site builds and serves as a coherent Jekyll website.
- Navigation is real and consistent across all pages.
- Home, Services, About, Contact, Privacy, Terms, and 404 pages exist.
- The design feels unified under the Gore Financial Services brand.
- External prototype-only image dependencies have been removed or deliberately replaced.
- The contact form works end to end through an approved external service.
- Metadata, favicon, robots, and sitemap are in place.
- The site passes a manual responsive and navigation QA pass.
- The site is deployed successfully to GitHub Pages.

## Suggested Immediate Next Step

The next implementation step should be to create `AGENTS.md` and the Jekyll site shell together, because those two pieces define both the working rules and the production structure for everything that follows.