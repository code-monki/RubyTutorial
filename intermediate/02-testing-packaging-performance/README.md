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

1. In `test/agent_lab_test.rb`, add a test for `Transcript#by_role`.
2. Run `ruby -Ilib test/all_test.rb` and confirm the new test fails before the implementation is changed or passes if the method already behaves correctly.
3. Read the existing `Gemfile` and identify which gem group contains RuboCop.
4. In `lib/agent_lab/transcript.rb`, add `word_tally_single_pass`.
5. Update `allocation_probe.rb` to compare `word_tally` and `word_tally_single_pass`.

## Exit Criteria

- You can run tests without a framework.
- You can explain `Gemfile` versus `.gemspec`.
- You can read a benchmark skeptically.
