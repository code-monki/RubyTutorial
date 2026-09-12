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

1. In `lookup_chain.rb`, add a second module and use `include` for that module.
2. Print `MessageLike.ancestors` and compare the position of the included module with the prepended module.
3. In `capability_dsl.rb`, create the same `:shout` capability through explicit `AgentLab::Capability.new(...)` construction.
4. Build one agent with the DSL capability and one agent with the explicit capability. Confirm both return the same result.
5. Write a short paragraph naming one benefit and one debugging cost of the DSL version.

## Exit Criteria

- You can explain eigenclasses without mystical language.
- You can predict method lookup order.
- You can decide whether a DSL is earning its keep.
