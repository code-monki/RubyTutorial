# Reading Map

This file maps each concept to a small reading target, one focused code example, a modification task, and exit criteria.

Use it when you know programming already but do not yet know how Ruby expresses the concept.

## Basic Ruby

### Truthiness And Absence

Read:

- Ruby docs for control expressions and conditionals.
- Ruby docs for `nil` and `false`.

Run:

```sh
ruby basic/01-syntax-semantics/examples/01_truthiness.rb
```

Modify:

- Add `""`, `"false"`, `:symbol`, and `Object.new`.

Exit:

- Explain why only `nil` and `false` are falsey.
- Explain why emptiness checks should be explicit.

### Equality And Identity

Read:

- Ruby docs for `Object#==`, `Object#eql?`, `Object#equal?`, and `Object#===`.
- Ruby docs for `Hash` key behavior.

Run:

```sh
ruby basic/01-syntax-semantics/examples/02_equality.rb
```

Modify:

- Compare two arrays with the same contents.
- Compare two symbols with the same name.
- Add a custom class with `==`.

Exit:

- Choose the right equality method for comparison, hash keys, and identity.

### Symbols, Strings, And Hash Keys

Read:

- Ruby docs for `Hash`.
- Ruby docs for `Symbol`.

Run:

```sh
ruby basic/01-syntax-semantics/examples/03_hash_keys.rb
```

Modify:

- Add a nested hash.
- Fetch a missing key with `fetch`.
- Add a default value and observe the behavior.

Exit:

- Explain why `:role` and `"role"` are different keys.
- Explain why framework conveniences should not be confused with Ruby itself.

### Method Calls, Parentheses, And Barewords

Read:

- Ruby syntax docs for method calls.
- Ruby syntax docs for assignment and local variables.

Run:

```sh
ruby basic/01-syntax-semantics/examples/04_barewords.rb
```

Modify:

- Add parentheses to every method call with arguments.
- Remove only the parentheses that improve readability when omitted.

Exit:

- Explain when a bareword is parsed as a local variable.
- Use parentheses for calls with arguments unless omitting them clearly improves readability.

### Pattern Matching

Read:

- Ruby docs for pattern matching.

Run:

```sh
ruby basic/01-syntax-semantics/examples/05_pattern_matching.rb
```

Modify:

- Add a pattern for an assistant message.
- Add an unmatched shape and handle it explicitly.

Exit:

- Use pattern matching for shape checks.
- Avoid replacing simple conditionals with pattern matching when it does not clarify the code.

## Intermediate Ruby

### Enumerable Protocol

Read:

- Ruby docs for `Enumerable`.
- Ruby docs for `Enumerator`.

Run:

```sh
ruby -Ilib intermediate/01-enumerable-and-iterators/examples/custom_transcript_each.rb
```

Modify:

- Add one query implemented first as a loop, then as an Enumerable chain.

Exit:

- Implement `each`.
- Return `enum_for` when no block is supplied.
- Explain one allocation cost in an Enumerable chain.

### Testing And Allocation

Read:

- Ruby docs for Minitest.
- Ruby docs for `Benchmark`, `GC`, and `ObjectSpace`.

Run:

```sh
ruby -Ilib test/all_test.rb
ruby -Ilib intermediate/02-testing-packaging-performance/examples/allocation_probe.rb
```

Modify:

- Add a single-pass version of `Transcript#word_tally`.
- Compare its allocations with the existing implementation.

Exit:

- Use measurements to support performance claims.
- Keep benchmark conclusions narrow.

## Advanced Ruby

### Method Lookup And Singleton Classes

Read:

- Ruby docs for modules and classes.
- Ruby docs for `Module#ancestors`, `Object#singleton_class`, and method objects.

Run:

```sh
ruby advanced/01-object-model-metaprogramming/examples/lookup_chain.rb
```

Modify:

- Add one `include` example and compare it with `prepend`.

Exit:

- Predict the method lookup path.
- Explain where singleton methods are stored.

### DSLs And Reflection

Read:

- Ruby docs for blocks, `instance_eval`, and `define_method`.
- Ruby docs for `TracePoint`.

Run:

```sh
ruby -Ilib advanced/01-object-model-metaprogramming/examples/capability_dsl.rb
```

Modify:

- Rewrite the DSL declaration as explicit object construction.

Exit:

- State what the DSL improves.
- State what the DSL makes harder to debug or validate.

### Parser And AST Work

Read:

- Ruby Prism docs.

Run:

```sh
ruby advanced/02-runtime-networking-ast/examples/prism_calls.rb
```

Modify:

- Report line numbers for each call if the Prism node exposes location data.

Exit:

- Inspect Ruby source without executing it.
- Explain when static analysis is safer than runtime hooks.
