# Ruby Rosetta Stone

Organized by concept rather than syntax. Keep adding to this file as you trip over interference from other languages.

## Truth And Absence

Ruby:

- Only `nil` and `false` are falsey.
- `0`, empty strings, empty arrays, and empty hashes are truthy.
- `nil` is an object, not a null pointer.

Trap:

- JavaScript, Python, C, and shell habits will mislead you here.

Ruby thought:

```ruby
return "missing" unless value
```

This means "nil or false", not "empty."

## Equality And Identity

Ruby:

- `==` is semantic equality.
- `eql?` is hash-key equality.
- `equal?` is object identity.
- `===` is case equality, used by `case` and pattern-ish dispatch.

Trap:

- Do not import Java's `equals`/identity split or JavaScript's coercion anxiety wholesale. Ruby has its own stack of comparison protocols.

## Method Calls And Receivers

Ruby:

- Almost everything is a method call.
- Parentheses are optional in many places.
- A bareword may be a local variable or a method call depending on prior assignment in the current scope.

Trap:

- Ruby decides whether a bareword is a local variable based on assignment in the current scope. Learn this rule so bareword behavior is predictable.

## Blocks, Procs, Lambdas

Ruby:

- A block is passed implicitly to a method.
- `yield` invokes the block.
- `&block` captures a block as a `Proc`.
- `lambda` checks arity more strictly and returns locally.
- A non-lambda `Proc` has looser arity and `return` tries to return from the defining method context.

Trap:

- Treating blocks as "just lambdas" will produce control-flow bugs.

## Keyword Arguments

Ruby:

- Keyword arguments are distinct from positional hash arguments.
- Double splat `**` forwards keyword arguments.
- Argument forwarding `...` exists for wrapper methods.

Trap:

- Old Ruby code that passed final hashes as pseudo-keywords may need modernization.

## Mutation And Freezing

Ruby:

- Many core objects are mutable.
- `freeze` prevents mutation of that object, not necessarily deep object graphs.
- Bang methods usually signal danger or mutation, but the convention is not a law.

Trap:

- `map!` is obvious. Hidden mutation through shared arrays and hashes is less obvious.

## Constants And Namespaces

Ruby:

- Constants are looked up through lexical nesting and ancestors.
- Constants can be reassigned with warnings.
- Autoloading conventions are tooling/framework mediated.

Trap:

- `A::B` and nested `module A; module B; end; end` do not always create identical lookup intuition.

## Object Model

Ruby:

- Classes are objects.
- Modules participate in ancestor chains.
- Singleton methods live in singleton classes.
- `include`, `prepend`, and `extend` alter lookup differently.

Trap:

- "Class method" is convenient speech. Mechanically, it is usually a singleton method on a class object.

## Errors

Ruby:

- Exceptions inherit from `Exception`, but application code typically rescues `StandardError`.
- Bare `rescue` catches `StandardError`, not all exceptions.

Trap:

- Catching too broadly can intercept system-exiting or interrupt-like conditions you should not swallow.

## Enumerables

Ruby:

- Implement `each`, include `Enumerable`, and a whole query vocabulary appears.
- Good iterator methods return an Enumerator when no block is supplied.

Trap:

- Elegant chains may allocate intermediate arrays unless you use lazy enumeration or combine passes.

## Pattern Matching

Ruby:

- Pattern matching can destructure arrays, hashes, and objects participating through protocol methods.
- It is useful for shape checks, not a mandate to replace clear conditionals.
- In a pattern, `SomeClass => name` checks the value with `SomeClass === value` and binds the matched value to `name`.
- The standalone form `value => pattern` asserts that `value` matches `pattern`; if it does not, Ruby raises `NoMatchingPatternError`.

Trap:

- Do not confuse pattern binding, such as `String => content`, with hash key/value syntax, such as `{ "content" => "Hello" }`.
- Pattern matching is not the same cultural center in Ruby as in Elixir, F#, OCaml, or modern Scala.

## Concurrency

Ruby:

- Threads are real OS threads in CRuby, but the Global VM Lock shapes CPU-bound parallelism.
- Fibers provide cooperative concurrency.
- Ractors provide isolation-oriented parallelism with shareability constraints.

Trap:

- "Ruby has threads" and "Ruby gives my CPU-bound code linear parallel speedup" are different statements.
