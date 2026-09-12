# Ruby Re-entry Curriculum

For an experienced polyglot software architect returning to Ruby after roughly 25 years.

This is not a beginner programming course. It is a cache-warming curriculum for Ruby 4.x syntax, semantics, idiom, tooling, and runtime behavior. The center of gravity is Ruby itself: Rails is surveyed, not worshipped.

## How To Use This Repository

Start with `weekend-plan.md` if you want the first two days to be productive. Then move through:

1. `basic/` - syntax, semantics, blocks, files, simple command-line programs.
2. `intermediate/` - idiomatic program design, Enumerable, tests, packaging, typing, concurrency, performance, and selected data structures.
3. `advanced/` - object model internals, metaprogramming, DSLs, networking, parser/AST work, instrumentation, runtime, GC, and JIT.
4. `capstone/agent_framework/` - the continuing non-web project that asks whether contemporary Ruby is a good language for agent frameworks and internal DSLs.

The continuing project begins as a tiny message/transcript model and gradually becomes a packaged, testable, inspectable, optionally typed, concurrent, DSL-driven agent runtime.

## Repository Map

- `curriculum.md` - full sequence, lesson objectives, exit criteria, and adversarial notes.
- `ruby-rosetta-stone.md` - concept-first comparisons against other languages.
- `references/research-notes.md` - current primary sources and ecosystem notes.
- `LICENSE.md` - Creative Commons Attribution-ShareAlike 4.0 International for curriculum/documentation.
- `LICENSE-CODE.md` - MIT License for runnable code, examples, tests, and scripts.
- `lib/agent_lab/` - small Ruby library used by examples and tests.
- `labs/algorithms/` - selected data-structure and algorithm labs used as Ruby-learning laboratories.
- `test/` - Minitest tests for the runnable examples.

## Running The Code

From this directory:

```sh
ruby -Ilib test/all_test.rb
```

No gem installation is required for the initial material.

## Recommended Environment Setup

Use a normal Ruby-on-your-machine setup first, not Docker or Vagrant.

The recommended isolation model is:

- a Ruby version manager or RubyInstaller to provide Ruby `4.0.x`;
- `.ruby-version` to pin this repo to Ruby `4.0.6`;
- Bundler configured to install project gems under `vendor/bundle`;
- `bundle exec` when running commands provided by gems.

This is the Ruby equivalent of a lightweight project environment. It keeps the tutorial close to the language while avoiding global gem clutter.

### macOS / Linux / WSL

Recommended choices:

- `mise` if you already use it for multiple languages.
- `rbenv` if you want the most common Ruby-specific version-manager path.
- `chruby` + `ruby-install` if you prefer small, explicit tools.

Avoid using the system Ruby that ships with macOS or a Linux distribution unless you are only running the no-gem starter examples.

Once Ruby `4.0.x` is available:

```sh
ruby bin/setup
bundle exec ruby -Ilib test/all_test.rb
```

Inside WSL, use the same commands.

### Windows PowerShell

Recommended choice for native Windows:

- Install Ruby+Devkit 4.0.x from RubyInstaller.
- RubyInstaller with Devkit is preferable to plain RubyInstaller because later lessons may use gems with native extensions.
- `mise` is also viable on Windows if you already use it; it installs Ruby through RubyInstaller2 there.

After installing Ruby, confirm the tools are on `PATH`:

```powershell
ruby -v
bundle -v
gem -v
```

Then run:

```powershell
.\bin\setup.ps1
bundle exec ruby -Ilib test/all_test.rb
```

Windows notes:

- Shell examples in the curriculum mostly use Unix-style paths; the Ruby code should remain portable unless a lesson is explicitly OS-specific.
- Prefer `Pathname`, `File.join`, and library APIs over hard-coded path separators.
- Native gems may require the RubyInstaller Devkit/MSYS2 tooling.

### Why Not Docker Or Vagrant First?

Docker and Vagrant are useful when you need OS-level reproducibility, services, native dependency parity, or deployment simulation. They are intentionally not the default here because the first goal is to rebuild Ruby fluency with short feedback loops.

Use Docker later when a lesson needs databases, Redis, native libraries, or CI/deployment parity. Treat Vagrant as historical/contextual unless a full VM is specifically useful.

For deeper setup notes, read `setup/ruby-environment.md`. Later lessons deliberately introduce Bundler, gems, RuboCop, RBS/Steep or Sorbet, benchmarking gems, and package structure.

## What This Curriculum Optimizes For

After a long absence from Ruby, the dangerous gap is not "can you write loops?" It is "do you naturally think in blocks, receivers, Enumerable chains, object openness, constants, keyword arguments, mutation boundaries, and the runtime consequences of cleverness?"

This curriculum repeatedly asks:

> What will I be able to think naturally in Ruby after this lesson that I could not before it?

It also treats idiom as a hypothesis, not a costume. Ruby lets you make beautiful APIs and terrible invisible machinery with the same features. That is the point of studying it carefully.

## License

This repository uses a split license:

- Curriculum text, explanations, lesson plans, exercises, and reference notes: Creative Commons Attribution-ShareAlike 4.0 International, `CC BY-SA 4.0`. See `LICENSE.md`.
- Runnable code examples, tests, scripts, and project source files: MIT License. See `LICENSE-CODE.md`.

The intent is simple: share-alike for the educational material, permissive reuse for the code.
