$ErrorActionPreference = 'Stop'

$root = Resolve-Path (Join-Path $PSScriptRoot '..')
$excludedDirs = @(
  'gore_financial_services_updated_homepage',
  'gore_financial_services_about_us',
  'gore_financial_services_contact_form',
  'gore_financial_service_mastercard_inspired_style',
  '.git',
  '.github',
  '_site',
  'docs',
  'node_modules',
  'qa',
  'scripts',
  'vendor'
)

$productionFiles = Get-ChildItem -Path $root -Recurse -File | Where-Object {
  $pathParts = [regex]::Split($_.FullName, '[\\/]+')
  $isExcluded = $false

  foreach ($excludedDir in $excludedDirs) {
    if ($pathParts -contains $excludedDir) {
      $isExcluded = $true
      break
    }
  }

  $_.Extension -in '.html', '.md', '.yml', '.xml', '.txt', '.js', '.css' -and
  $_.Name -notin @('README.md', 'roadmap.md') -and
  -not $isExcluded
}

$checks = @(
  @{ Name = 'Placeholder link'; Pattern = 'href="#"|action="#"' },
  @{ Name = 'Prototype hosted Google asset'; Pattern = 'lh3\.googleusercontent\.com' }
)

$failures = New-Object System.Collections.Generic.List[string]

foreach ($check in $checks) {
  foreach ($file in $productionFiles) {
    $matches = Select-String -Path $file.FullName -Pattern $check.Pattern -AllMatches
    foreach ($match in $matches) {
      $failures.Add("$($check.Name): $($file.FullName):$($match.LineNumber)")
    }
  }
}

if ($failures.Count -gt 0) {
  Write-Host 'Static-site validation failed:' -ForegroundColor Red
  $failures | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
  exit 1
}

$settingsPath = Join-Path $root '_data/site_settings.yml'
$settingsRaw = Get-Content -Path $settingsPath -Raw
if ($settingsRaw -match 'form_endpoint:\s*""') {
  Write-Host 'Warning: form_endpoint is still empty in _data/site_settings.yml. Configure it before launch.' -ForegroundColor Yellow
}

Write-Host 'Static-site validation passed.' -ForegroundColor Green
