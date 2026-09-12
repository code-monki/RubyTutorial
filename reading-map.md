# Reading Map

This file maps each concept to a small reading target, one focused code example, a modification task, and exit criteria.

Use it when you know programming already but do not yet know how Ruby expresses the concept.

## Basic Ruby

### Truthiness And Absence

Read:

- [Ruby control expressions](https://docs.ruby-lang.org/en/4.0/syntax/control_expressions_rdoc.html), especially the opening truth-value rule and `if`/`unless`.
- [`NilClass`](https://docs.ruby-lang.org/en/4.0/NilClass.html) and [`FalseClass`](https://docs.ruby-lang.org/en/4.0/FalseClass.html).

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

- [`BasicObject#==`, `#eql?`, and `#equal?`](https://docs.ruby-lang.org/en/4.0/BasicObject.html).
- [Ruby control expressions](https://docs.ruby-lang.org/en/4.0/syntax/control_expressions_rdoc.html), especially `case` and `===`.
- [`Hash`](https://docs.ruby-lang.org/en/4.0/Hash.html), especially key equality.

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

- [`Hash`](https://docs.ruby-lang.org/en/4.0/Hash.html).
- [`Symbol`](https://docs.ruby-lang.org/en/4.0/Symbol.html).

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

- [Calling methods](https://docs.ruby-lang.org/en/4.0/syntax/calling_methods_rdoc.html).
- [Assignment](https://docs.ruby-lang.org/en/4.0/syntax/assignment_rdoc.html), especially local variable parsing.

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

- [Pattern matching](https://docs.ruby-lang.org/en/4.0/syntax/pattern_matching_rdoc.html).

Note:

- In a pattern, `String => content` means "match a `String`, then bind the matched value to the local variable `content`."
- The standalone form `value => pattern` checks that `value` matches `pattern` and raises `NoMatchingPatternError` if it does not.
- This is different from the older hash-rocket syntax, such as `{ "role" => "user" }`, which creates a hash key/value pair.

Run:

```sh
ruby basic/01-syntax-semantics/examples/05_pattern_matching.rb
```

Modify:

- Add a pattern for an assistant message.
- Add an unmatched shape and handle it explicitly.
- Add one standalone `message => pattern` example that binds two local variables.

Exit:

- Use pattern matching for shape checks.
- Explain the difference between `String => content` in a pattern and `"key" => value` in a hash.
- Avoid replacing simple conditionals with pattern matching when it does not clarify the code.

## Intermediate Ruby

### Enumerable Protocol

Read:

- [`Enumerable`](https://docs.ruby-lang.org/en/4.0/Enumerable.html).
- [`Enumerator`](https://docs.ruby-lang.org/en/4.0/Enumerator.html).

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

- [Minitest documentation](https://docs.seattlerb.org/minitest/).
- [`Benchmark`](https://docs.ruby-lang.org/en/4.0/Benchmark.html).
- [`GC`](https://docs.ruby-lang.org/en/4.0/GC.html).
- [`ObjectSpace`](https://docs.ruby-lang.org/en/4.0/ObjectSpace.html).

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

- [Ruby FAQ: method lookup](https://www.ruby-lang.org/en/documentation/faq/7/).
- [`Module`](https://docs.ruby-lang.org/en/4.0/Module.html), especially `ancestors`, `include`, `prepend`, and `define_method`.
- [`BasicObject#singleton_method_added`](https://docs.ruby-lang.org/en/4.0/BasicObject.html) and method-related object behavior.
- [`Method`](https://docs.ruby-lang.org/en/4.0/Method.html).

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

- [Calling methods: block arguments](https://docs.ruby-lang.org/en/4.0/syntax/calling_methods_rdoc.html).
- [`Proc`](https://docs.ruby-lang.org/en/4.0/Proc.html).
- [`BasicObject#instance_eval`](https://docs.ruby-lang.org/en/4.0/BasicObject.html).
- [`Module#define_method`](https://docs.ruby-lang.org/en/4.0/Module.html).
- [`TracePoint`](https://docs.ruby-lang.org/en/4.0/TracePoint.html).

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

- [`Prism`](https://docs.ruby-lang.org/en/4.0/Prism.html).

Run:

```sh
ruby advanced/02-runtime-networking-ast/examples/prism_calls.rb
```

Modify:

- Report line numbers for each call if the Prism node exposes location data.

Exit:

- Inspect Ruby source without executing it.
- Explain when static analysis is safer than runtime hooks.
