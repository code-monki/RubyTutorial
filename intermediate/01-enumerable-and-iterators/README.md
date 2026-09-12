# I1: Enumerable And Custom Iterators

## What You Will Think Naturally After This Lesson

You will design Ruby objects that participate in the language's collection vocabulary instead of only exposing an internal array.

## Learning Objectives

- Implement `each` correctly.
- Return an Enumerator when no block is given.
- Use `Enumerable` methods as design vocabulary.
- Notice allocation and multi-pass costs.

## Run

```sh
ruby -Ilib intermediate/01-enumerable-and-iterators/examples/custom_transcript_each.rb
```

## Exercises

1. Add `Transcript#between(start_time, end_time)`.
2. Implement the query first with a loop, then with `select`.
3. Add a lazy version for streaming very large transcripts.
4. Benchmark or at least reason about intermediate allocation.

## Exit Criteria

- You can explain the protocol: `each` plus `Enumerable`.
- You can name when `map.filter` is worse than `filter_map`.
- You can decide when clarity beats shaving an allocation.
