# Algorithm And Data-Structure Labs

These labs are Ruby-learning laboratories, not a generic CS course.

## Rules

1. Manual implementations should be followed, where useful, by idiomatic Ruby and standard-library/gem approaches.
2. Every implementation exercise must state its Ruby-learning objective.
3. Do not confuse CS sophistication with Ruby sophistication.

## Included Labs

### Queue

File: `queue.rb`

Ruby-learning objective:

- Practice small mutable objects, `Enumerable`, `each`, `enum_for`, and amortized cleanup.

Follow-up idiomatic/library comparison:

- Compare with `Array#push`/`shift`, then with thread-safe `Thread::Queue` from standard library.

### Quicksort

File: `quicksort.rb`

Ruby-learning objective:

- Practice blocks as comparators, recursive method style, case/range matching, array partitioning, and allocation tradeoffs.

Follow-up idiomatic/library comparison:

- Compare with `Array#sort`, then benchmark against the manual implementation. The standard library version should win for real use.

### Graph BFS

File: `graph.rb`

Ruby-learning objective:

- Practice `Hash` defaults, `Set`, custom queues, Enumerator-returning traversal, and block-yield APIs.

Follow-up idiomatic/library comparison:

- Compare with `TSort` for topological sorting, and with graph gems only after you have defined the protocol you need.

## Omitted On Purpose

- Bubble sort: use only if mining The Odin Project for warm-up exercises. It teaches little new Ruby once Quicksort and `sort` are covered.
- Full red-black tree: valuable CS, low Ruby-specific yield for this curriculum.
- Hand-rolled hash table beyond one optional lab: useful for `hash`/`eql?`, but easy to become generic CS review.

