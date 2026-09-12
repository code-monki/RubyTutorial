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

1. In `custom_transcript_each.rb`, add a query that returns messages whose content includes `"group"`.
2. Implement the query first with an explicit `each` loop and an output array.
3. Implement the same query again with `select`.
4. Print both results and confirm they contain the same message content.

## Exit Criteria

- You can explain the protocol: `each` plus `Enumerable`.
- You can name when `map.filter` is worse than `filter_map`.
- You can decide when clarity beats shaving an allocation.
