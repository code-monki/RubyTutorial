# Ruby Environment Setup

Goal: keep this curriculum's Ruby version and gems from polluting your main machine environment.

## Recommended Default

Use a Ruby version manager for the interpreter and Bundler for project-local gems.

This gives you two layers of isolation:

- `.ruby-version` selects the Ruby interpreter for this repo.
- Bundler installs project libraries under `vendor/bundle` instead of into a global gem home.

Short version:

```sh
ruby bin/setup
bundle exec ruby -Ilib test/all_test.rb
```

That keeps this repo close to normal Ruby development while avoiding global gem clutter.

On Windows PowerShell:

```powershell
.\bin\setup.ps1
bundle exec ruby -Ilib test/all_test.rb
```

## Step 1: Use A Ruby Version Manager

Good options on macOS/Linux:

- `mise`: a modern multi-language version manager. Good if you also juggle Node, Python, Go, etc.
- `rbenv`: boring in the best way; Ruby-focused, widely documented, and stable.
- `chruby` + `ruby-install`: small, explicit, and pleasant if you like minimal tooling.

Recommendation for this repo:

- Use `mise` if you already use it for other languages.
- Use `rbenv` if you want the most Ruby-community-standard path.
- Avoid using macOS system Ruby for this curriculum.
- Do not start with Docker or Vagrant; they solve heavier environment problems than this curriculum has at the beginning.

## Windows Setup

There are two good Windows paths.

### Option A: Native Windows With RubyInstaller

This is the recommended path for a student who wants the least ceremony.

1. Install Ruby+Devkit 4.0.x from RubyInstaller, or use Windows Package Manager if available.
2. Open PowerShell.
3. Confirm Ruby is available:

```powershell
ruby -v
bundle -v
gem -v
```

4. From this repo:

```powershell
.\bin\setup.ps1
bundle exec ruby -Ilib test/all_test.rb
```

Prefer the Ruby+Devkit installer, not the plain Ruby installer, if the learner may install gems with native extensions later. Native extensions are common enough in Ruby that avoiding the Devkit is a short-term convenience with a long tail.

### Option B: WSL

Use WSL if the learner wants the closest match to macOS/Linux Ruby workflows, shell examples, and Unix command-line habits.

Inside WSL, follow the macOS/Linux path with `mise`, `rbenv`, or the distribution's Ruby packages. For this tutorial, a version manager is still preferable when Ruby 4.x availability matters.

### Option C: mise On Windows

`mise` can manage Ruby on Windows and uses RubyInstaller2 for Ruby installs there. This is attractive if the learner already uses `mise` for other languages. If not, RubyInstaller directly is easier to explain.

## Windows Caveats

- Shell examples in the curriculum use Unix-style paths. The Ruby code itself should remain portable unless a lesson explicitly studies OS behavior.
- Native gems may need the RubyInstaller Devkit/MSYS2 tooling.
- Some networking, process, and shell-escaping lessons will have Windows-specific differences.
- Prefer `Pathname`, `File.join`, and library APIs over hard-coded path separators in exercises.

This repository includes:

```text
.ruby-version
```

That file currently pins Ruby `4.0.6`, matching the local interpreter used to build and verify these examples.

## Step 2: Install Gems Locally To The Project

From the repo root:

```sh
bundle config set --local path vendor/bundle
bundle install
```

This writes Bundler's local machine config under `.bundle/`, which is intentionally ignored by Git.

The repository's `bin/setup` script runs those commands for you.
On Windows, `bin/setup.ps1` does the same thing.

After that, run gem executables through Bundler:

```sh
bundle exec ruby -Ilib test/all_test.rb
bundle exec rubocop
```

## Step 3: Keep Generated And Local Files Out Of Git

This repo ignores:

- `.bundle/`
- `vendor/bundle/`
- `.yardoc/`
- `coverage/`
- temporary transcript files

Commit:

- `.ruby-version`
- `Gemfile`
- `Gemfile.lock` once you have run `bundle install`

Do not commit:

- `.bundle/config`
- installed gems under `vendor/bundle`

## Notes On "Virtual Environment" Terminology

Ruby does not use virtual environments in exactly the Python sense. The closest practical setup is:

- interpreter isolation through `mise`, `rbenv`, `chruby`, or another manager;
- dependency isolation through Bundler and a local install path;
- command isolation through `bundle exec`.

That combination is enough for this curriculum and for most normal Ruby application/library work.

The older Ruby-specific tool you may remember is probably RVM gemsets. They are still a real concept, but this repo uses Bundler-local gems instead because it is more explicit, less tied to one version manager, and closer to how modern Ruby projects usually communicate dependencies.

## Devil's Advocate

Per-project `vendor/bundle` is tidy but can consume disk space across many projects. If you work on a lot of Ruby repos, a version-manager gem home plus `bundle exec` may be sufficient. For a curriculum repo, the extra isolation is worth it because we will intentionally experiment with tooling gems, profilers, type checkers, and linters.

## Sources To Trust First

- Ruby's official installation guide documents using package managers, installers, version managers, and source builds.
- rbenv documents `.ruby-version`/`rbenv local` and per-version gem homes.
- RubyGems/Bundler guides document `Gemfile`, `Gemfile.lock`, `bundle exec`, local config, and project install paths.
- RubyInstaller documents the Windows installer, Ruby+Devkit builds, MSYS2 Devkit, and Windows package-manager options.
