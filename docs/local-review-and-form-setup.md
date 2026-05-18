# Local Review And Form Setup

## Goal

This document defines the smallest reliable path to run the Gore Financial Services website locally for review and the recommended options for enabling the contact form securely on a static GitHub Pages deployment.

## Recommended Local Runtime

Run the site inside WSL using Conda for the Ruby runtime and Bundler for project gems.

Why this is the preferred setup:

- The repository already lives on a WSL filesystem path.
- Ruby and Jekyll behave more predictably in Linux-like environments than on mixed Windows plus WSL file paths.
- The site does not need Node, npm, or a separate Tailwind build step for review.

## Environment Setup Steps

From a WSL shell in the repository root:

```bash
conda env create -f environment.yml
conda activate gore-financial-pages-review
gem install bundler
bundle install
```

Files involved:

- `environment.yml`
- `Gemfile`

## Dependency Installation Plan

The local dependency model is intentionally small.

### Conda-managed packages

- `ruby=3.2`
- `git`

### Bundler-managed gems

- `jekyll ~> 4.3`
- `webrick ~> 1.8`

Rationale:

- Ruby comes from Conda so the local environment stays isolated.
- Jekyll and Webrick come from RubyGems because that is the standard and most reliable Jekyll runtime path.
- No Node step is required because the site uses Tailwind via CDN.

## Local Run And Test Workflow

### Start local review server

```bash
bundle exec jekyll serve --livereload --host 127.0.0.1 --port 4000
```

Review the site at:

`http://127.0.0.1:4000`

### Validate before sign-off

```bash
bundle exec jekyll build
```

Then run the normal manual checks:

1. Verify Home, Services, About, Contact, Insights, Privacy, Terms, and 404 pages render.
2. Check the mobile menu and shared footer.
3. Confirm local assets load correctly.
4. If a real form endpoint is configured, submit a test enquiry.
5. Optionally run the existing PowerShell validator from a PowerShell terminal:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\validate-static-site.ps1
```

## Current Form Integration Surface

The current contact form implementation lives in:

- `_includes/contact-form.html`

The public provider configuration lives in:

- `_data/site_settings.yml`

The site already supports a public endpoint-driven provider model through:

- `form_provider`
- `form_endpoint`

That means the lowest-friction provider integration does not require a structural rewrite of the form.

## Recommended Provider Options

## Option 1: Formspree

### Why it is suitable

- Best fit for a GitHub Pages-hosted static site.
- Direct HTML form endpoint model matches the existing implementation.
- Free tier is practical for low-volume testing and early launch.
- Server-side spam filtering and validation are already part of the service.

### Setup steps

1. Create a form in Formspree.
2. Copy the generated public endpoint.
3. Update `_data/site_settings.yml`:

```yaml
form_provider: Formspree
form_endpoint: "https://formspree.io/f/your-form-id"
```

4. Run the site locally and verify the contact form posts to the provider endpoint.
5. Submit a test enquiry from the local review site.

### Security considerations

- Keep browser-side required fields enabled.
- Enable provider-side spam controls and CAPTCHA if traffic quality drops.
- Use HTTPS only in production.
- Keep secrets out of the Jekyll repository. Formspree only needs a public endpoint in the static site.
- Restrict domains or origins where supported.

## Option 2: Web3Forms

### Why it is suitable

- Easy static-site integration.
- Free tier and quick email-driven setup.
- HTTPS transport and encrypted storage are part of the service.
- Built-in honeypot pattern is straightforward.

### Setup steps

1. Create a Web3Forms access key.
2. Update `_data/site_settings.yml` to reflect the provider choice.
3. Extend `_includes/contact-form.html` to add:
   - `action="https://api.web3forms.com/submit"`
   - hidden `access_key`
   - hidden honeypot field such as `botcheck`
4. Add an optional redirect field if a hosted success page is desired.
5. Submit a local test enquiry.

### Security considerations

- The access key is public in a static site, so treat it as a public identifier, not a secret.
- Add honeypot protection and keep browser validation enabled.
- Use HTTPS only.
- Monitor for abuse because the public key model offers less control than a server-validated receiver.

## Option 3: Cloudflare Turnstile Plus Lightweight Receiver

### Why it is suitable

- Strongest control over spam handling and validation.
- Best path if the contact form becomes a serious abuse target.
- Supports proper server-side verification and rate limiting.
- Turnstile is free and can be used independently of Cloudflare CDN hosting.

### Setup steps

1. Create a Turnstile widget and get a site key plus secret key.
2. Add the Turnstile widget to `_includes/contact-form.html`.
3. Send the form submission to a lightweight receiver such as a Cloudflare Worker.
4. Validate the Turnstile token server-side on every request.
5. Sanitize the payload and forward it to email or secure storage.
6. Return clear success and error responses to the frontend.

### Security considerations

- Server-side token validation is mandatory.
- Keep Turnstile secrets and email provider keys outside the Jekyll repository.
- Enforce origin checks.
- Add request rate limiting and abuse logging.
- Minimize retained personal data and store it securely.
- Serve over HTTPS only.

## Recommended Option For This Project

Use **Formspree** for this project.

Why:

- It fits the current static-site implementation immediately.
- It requires the fewest code changes.
- It keeps launch and review complexity low.
- It still provides server-side filtering and validation without introducing a backend to operate.

If the site later needs stronger anti-abuse controls, the best upgrade path is the Turnstile plus lightweight receiver approach.

## Required Configuration Files And Environment Variables

## Files used directly in this repository

- `environment.yml`
- `Gemfile`
- `_data/site_settings.yml`
- `_includes/contact-form.html`
- `README.md`

## Server-side environment variables for the advanced custom receiver option

These are not needed for Formspree. They apply only if a custom receiver is implemented.

- `TURNSTILE_SECRET_KEY`
- `ALLOWED_ORIGIN`
- `MAIL_PROVIDER_API_KEY`
- `MAIL_TO`
- `RATE_LIMIT_WINDOW_SECONDS`
- `RATE_LIMIT_MAX_REQUESTS`

See `.env.receiver.example` for a template.
