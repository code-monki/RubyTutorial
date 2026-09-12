# First Weekend Plan

Each segment is designed for roughly 60-90 minutes. Stop while the examples are still small enough to hold in your head.

## Segment 1: Ruby Shape And Friction Points

Use: `basic/01-syntax-semantics/README.md`

Outcome: You can read and write contemporary Ruby method calls, blocks, literals, truthiness checks, keyword arguments, safe navigation, pattern matching basics, and exception handling without mentally translating every line into another language first.

Do:

- Run `basic/01-syntax-semantics/examples/traps.rb`.
- Modify it to predict then verify `nil`, `false`, `0`, empty arrays, symbol/string hash keys, `==`, `eql?`, and `equal?`.
- Add three trap notes to `ruby-rosetta-stone.md`.

Exit criteria:

- You can explain why only `nil` and `false` are falsey.
- You can identify when parentheses are clarifying rather than noisy.
- You can distinguish local variable assignment from zero-argument method calls.

## Segment 2: Blocks, Binding, Enumerable

Use: `intermediate/01-enumerable-and-iterators/README.md`

Outcome: You can reach for blocks, custom `each`, lazy enumeration, and Enumerator-returning methods without treating them as callback syntax borrowed from another language.

Do:

- Run `intermediate/01-enumerable-and-iterators/examples/custom_transcript_each.rb`.
- Implement one new transcript query using `Enumerable`.
- Compare the obvious loop against the idiomatic version.

Exit criteria:

- You know when an `each` method should return `enum_for`.
- You can explain why `map`, `flat_map`, `filter_map`, `tally`, `chunk_while`, and `lazy` are not interchangeable decoration.
- You can name one performance or allocation cost in an elegant Enumerable chain.

## Segment 3: Tiny CLI Project

Use: `basic/02-cli-agent-log/README.md`

Outcome: You can build a small command-line Ruby program using `OptionParser`, files, JSON, modules, and small objects.

Do:

- Run `basic/02-cli-agent-log/examples/agent_log.rb --help`.
- Add and list messages in a temporary transcript file.
- Add one validation rule in `lib/agent_lab/message.rb`.

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
- Add a test that documents how duplicates are handled.

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
- Read the devil's-advocate notes on monkey-patching.

Exit criteria:

- You can explain eigenclass, singleton method, ancestor chain, and method lookup in plain language.
- You know why "open classes" are power tools, not house style.
- You can defer metaprogramming until the API design problem clearly justifies it.
