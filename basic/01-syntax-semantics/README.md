# B1: Syntax And Semantics Re-entry

## What You Will Think Naturally After This Lesson

You will read modern Ruby source in Ruby's own grammar: receiver, method call, block, return value, local variable, constant, and object protocol.

## Learning Objectives

- Rebuild confidence with method calls, literals, blocks, keyword arguments, safe navigation, ranges, symbols, and pattern matching.
- Predict truthiness and equality behavior without importing assumptions from Python, JavaScript, Java, C, or Lisp.
- Recognize method-call ambiguity caused by optional parentheses and local-variable parsing.

## Run

```sh
ruby basic/01-syntax-semantics/examples/traps.rb
```

## Exercises

1. Before running the example, predict every printed line.
2. Add examples for `case` using `===`.
3. Add one block-local variable example.
4. Rewrite one snippet with explicit parentheses, then decide which version is clearer.

## Exit Criteria

- You can explain why `0` and `[]` are truthy.
- You can choose between `==`, `eql?`, and `equal?`.
- You can identify when a bareword is a method call versus a local variable.

## Adversarial Notes

Optional parentheses are not a moral achievement. Rubyists often omit them when the call reads naturally, but production code is read under interruption. Clarity beats cosplay.

