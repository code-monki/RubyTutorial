# I3/I4/I7: Testing, Packaging, Performance

## What You Will Think Naturally After This Lesson

You will see Ruby project structure, dependency management, tests, and performance probes as one development loop.

## Learning Objectives

- Use Minitest as the zero-dependency baseline.
- Understand where Bundler and gemspecs enter the picture.
- Compare obvious, idiomatic, optimized, and library approaches.
- Measure before accepting performance advice.

## Run

```sh
ruby -Ilib test/all_test.rb
ruby -Ilib intermediate/02-testing-packaging-performance/examples/allocation_probe.rb
```

## Exercises

1. Add a test for `Transcript#by_role`.
2. Add a `Gemfile` with RuboCop as a development dependency.
3. Convert the project into a gem skeleton, but keep this curriculum repo readable.
4. Compare `word_tally` with a single-pass implementation.

## Exit Criteria

- You can run tests without a framework.
- You can explain `Gemfile` versus `.gemspec`.
- You can read a benchmark skeptically.
