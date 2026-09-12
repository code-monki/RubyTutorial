# SPDX-License-Identifier: MIT

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $RepoRoot

Write-Host "Ruby: $(ruby -v)"

if (-not (Test-Path "Gemfile")) {
  throw "Gemfile not found. Run this script from the repository checkout."
}

bundle config set --local path vendor/bundle
bundle install

New-Item -ItemType Directory -Force -Path "tmp" | Out-Null

Write-Host "Setup complete. Run: bundle exec ruby -Ilib test/all_test.rb"
