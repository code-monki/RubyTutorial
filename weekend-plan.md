# First Weekend Plan

Each segment is designed for roughly 60-90 minutes. Stop while the examples are still small enough to hold in your head.

## Segment 1: Ruby Shape And Friction Points

Use: `basic/01-syntax-semantics/README.md`

Outcome: You can read and write contemporary Ruby method calls, blocks, literals, truthiness checks, keyword arguments, safe navigation, pattern matching basics, and exception handling without mentally translating every line into another language first.

Do:

- Read the Basic Ruby entries in `reading-map.md`, one concept at a time.
- Run the numbered examples in `basic/01-syntax-semantics/examples/`.
- Modify one numbered example using its `Modify:` instructions from `reading-map.md`.
- Add three notes to `ruby-rosetta-stone.md` about Ruby behavior that differs from another language you know.

Exit criteria:

- You can explain why only `nil` and `false` are falsey.
- You can identify when parentheses are clarifying rather than noisy.
- You can distinguish local variable assignment from zero-argument method calls.

## Segment 2: Blocks, Binding, Enumerable

Use: `intermediate/01-enumerable-and-iterators/README.md`

Outcome: You can reach for blocks, custom `each`, lazy enumeration, and Enumerator-returning methods without treating them as callback syntax borrowed from another language.

Do:

- Run `intermediate/01-enumerable-and-iterators/examples/custom_transcript_each.rb`.
- In that file, add one transcript query using an explicit `each` loop.
- Add the same query again using `Enumerable#select`.
- Print both results and confirm they return the same messages.

Exit criteria:

- You know when an `each` method should return `enum_for`.
- You can explain why `map`, `flat_map`, `filter_map`, `tally`, `chunk_while`, and `lazy` are not interchangeable decoration.
- You can name one performance or allocation cost in an elegant Enumerable chain.

## Segment 3: Tiny CLI Project

Use: `basic/02-cli-agent-log/README.md`

Outcome: You can build a small command-line Ruby program using `OptionParser`, files, JSON, modules, and small objects.

Do:

- Run `ruby -Ilib basic/02-cli-agent-log/examples/agent_log.rb --help`.
- Add one user message to a temporary transcript file.
- List the transcript file and confirm the message appears.
- Add a CLI-level check that prints a clear error when `add` is run with empty content. Do not edit `lib/agent_lab/message.rb` in this segment; class internals come later.

Exit criteria:

- You can structure a small Ruby CLI without Rails, Thor, or a framework.
- You know when standard library code is enough.
- You can keep side effects at the edge.

## Segment 4: Tests And A First Algorithm Lab

Use: `intermediate/02-testing-packaging-performance/README.md` and `labs/algorithms/README.md`

Outcome: You can test Ruby behavior using Minitest, then use a data-structure exercise as a Ruby semantics lab rather than a generic CS drill.

Do:

- Run `ruby -Ilib test/all_test.rb`.
- Read `labs/algorithms/quicksort.rb`.
- In `test/algorithm_test.rb`, read the existing duplicate-handling test for Quicksort.
- Add one new test for already-sorted input.

Exit criteria:

- You can run tests with Ruby's built-in test framework.
- You can state the Ruby-learning objective of the Quicksort exercise.
- You can describe the tradeoff between elegant partitioning and allocation-heavy implementation.

## Segment 5: Object Model Preview

Use: `advanced/01-object-model-metaprogramming/README.md`

Outcome: You can see Ruby's object model as a live runtime mechanism, not just a class syntax.

Do:

- Run `advanced/01-object-model-metaprogramming/examples/lookup_chain.rb`.
- Predict where singleton methods live.
- Read the design warning on monkey-patching in `curriculum.md`.

Exit criteria:

- You can explain eigenclass, singleton method, ancestor chain, and method lookup in plain language.
- You know why "open classes" are power tools, not house style.
- You can defer metaprogramming until the API design problem clearly justifies it.
