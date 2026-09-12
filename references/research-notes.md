# Research Notes

Checked against current primary or near-primary sources on 2026-09-12.

## Ruby 4.x Baseline

- Official Ruby documentation lists Ruby 4.0 docs and Ruby master docs. Use Ruby 4.0 as the stable target, and treat master/4.1 material as forward-looking.
- Ruby 4.0.0 release notes introduce Ruby Box, ZJIT, Ractor improvements, YJIT changes, and removal of `--rjit`.
- Local verification in this workspace reports `ruby 4.0.6 (2026-07-14 revision 03b6d3f889) +PRISM [arm64-darwin25]`.

Primary sources:

- [Ruby documentation](https://www.ruby-lang.org/en/documentation/)
- [Ruby 4.0 standard library](https://docs.ruby-lang.org/en/4.0/standard_library_md.html)
- [Ruby 4.0.0 release notes](https://www.ruby-lang.org/en/news/2025/12/25/ruby-4-0-0-released/)
- [Ruby 4.0 Prism docs](https://docs.ruby-lang.org/en/4.0/Prism.html)
- [Ruby 4.0 ZJIT docs](https://docs.ruby-lang.org/en/4.0/jit/zjit_md.html)

## RubyGems And Bundler

- RubyGems guides describe Bundler as dependency management through `Gemfile` and `Gemfile.lock`.
- Current Bundler command reference is generated from Bundler 4.1.0 beta documentation, while RubyGems.org shows Bundler 4.0.x releases in 2026. Curriculum should teach concepts and commands conservatively.
- Avoid letting the learner update system RubyGems casually on managed machines.

Sources:

- [RubyGems getting started](https://guides.rubygems.org/getting_started/)
- [Bundler command reference](https://guides.rubygems.org/command-reference/bundle/)
- [RubyGems installation guide](https://guides.rubygems.org/installation/)

## Windows

- Ruby's official installation guide points Windows users to RubyInstaller and Windows Package Manager options.
- RubyInstaller provides Ruby+Devkit 4.0.6 builds for x64 and ARM as of this research pass. The Devkit/MSYS2 toolchain matters for gems with native extensions.
- Ruby 4.0 is also available through the Microsoft Store/winget packaging path, but Ruby+Devkit remains the clearest recommendation for learners who may later install native gems.
- `mise` supports Ruby on Windows through RubyInstaller2, but direct RubyInstaller is easier for a learner who does not already use `mise`.

Sources:

- [Ruby installation guide](https://www.ruby-lang.org/en/documentation/installation/)
- [RubyInstaller](https://rubyinstaller.org/)
- [RubyInstaller downloads](https://rubyinstaller.org/downloads/)
- [mise Ruby documentation](https://mise.en.dev/lang/ruby)

## Optional Types

- RBS is the Ruby signature language. Its repository states that standard library signatures target the latest Ruby release, currently 4.0 as of 2026.
- Sorbet remains a major production-oriented gradual typing option, with `srb` and `sorbet-runtime`.
- Sorbet has experimental RBS comment support powered by Prism. Mark it as experimental and do not present it as the default typing workflow.

Sources:

- [RBS repository](https://github.com/ruby/rbs)
- [Sorbet overview](https://sorbet.org/docs/overview)
- [Sorbet RBS support](https://sorbet.org/docs/rbs-support)

## Style And Static Analysis

- RuboCop remains the dominant linter/formatter ecosystem. It is configurable and modular; performance, Rails, RSpec, and Minitest checks live in extension gems.
- Teach RuboCop as a tool for shared conventions and linting. Do not present every RuboCop preference as a universal rule for good Ruby.

Sources:

- [RuboCop installation](https://docs.rubocop.org/rubocop/installation.html)
- [RuboCop cops](https://docs.rubocop.org/rubocop/latest/cops.html)

## The Odin Project

- The Odin Project's Ruby course includes beginner material, OOP, project management, RuboCop, files/serialization, pattern matching, blocks, custom enumerables, RSpec, recursion, data structures, and projects.
- For this learner, TOP is useful as a curated exercise pool, not as the curriculum order. The beginner pacing and generic CS portions should be selectively mined.

Source:

- [The Odin Project Ruby course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby)

## Rails And Ecosystem

- Rails remains central to the Ruby ecosystem, but this curriculum intentionally does not center Rails.
- Survey Rails through Rack, ActiveSupport idioms, Zeitwerk autoloading, ActiveRecord tradeoffs, job systems, and code-reading exercises after Ruby fundamentals are reestablished.

Source:

- [Rails documentation](https://rubyonrails.org/docs)

## Best-Practice Claims To Treat Skeptically

- "Ruby is readable": Ruby is readable when the code uses local idioms consistently and keeps hidden behavior limited.
- "DSLs are Ruby's superpower": DSLs are valuable when they improve the author's model and still provide clear errors, source locations, and debugging paths.
- "Monkey-patching is bad": the useful question is whether the patch has clear ownership, locality, reversibility, observability, and a small blast radius.
- "Types do not belong in Ruby": stable boundaries and public APIs can benefit from signatures; exploratory internal code may not.
- "Rails is Ruby": historically understandable, technically false.
