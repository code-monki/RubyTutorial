# A1/A2/A3: Object Model And Metaprogramming

## What You Will Think Naturally After This Lesson

You will be able to predict method lookup, singleton method placement, module precedence, and the maintenance cost of highly dynamic APIs.

## Learning Objectives

- Inspect ancestors and singleton classes.
- Compare `include`, `prepend`, and `extend`.
- Use `define_method` and a tiny DSL with restraint.
- Recognize when monkey-patching creates global risk.

## Run

```sh
ruby advanced/01-object-model-metaprogramming/examples/lookup_chain.rb
ruby -Ilib advanced/01-object-model-metaprogramming/examples/capability_dsl.rb
```

## Exercises

1. Add a `prepend` module and observe lookup order.
2. Convert the DSL example into explicit object construction.
3. Add source-location reporting for a declared capability.
4. Write a paragraph arguing against the DSL you just built.

## Exit Criteria

- You can explain eigenclasses without mystical language.
- You can predict method lookup order.
- You can decide whether a DSL is earning its keep.
