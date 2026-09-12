# A4/A5/A6: Runtime, Networking, AST

## What You Will Think Naturally After This Lesson

You will treat Ruby as both a language and a runtime: parseable source, observable execution, networked IO, GC pressure, and JIT tradeoffs.

## Learning Objectives

- Use `Socket`, `Net::HTTP`, `JSON`, `Timeout`, and `OpenSSL` with explicit boundaries.
- Use Prism to inspect Ruby source.
- Use TracePoint, ObjectSpace, GC stats, YJIT/ZJIT flags, and profiling gems judiciously.
- Understand FFI/native extension tradeoffs.

## Exercises

1. Run `examples/prism_calls.rb` and confirm it lists method calls from `capability_dsl.rb`.
2. Update `examples/prism_calls.rb` so it prints each call with a source line number when Prism exposes one.
3. Add TracePoint instrumentation around capability execution and print the method name being called.
4. Build a line-oriented TCP echo server for agent messages.
5. Run one benchmark with and without JIT flags, then write down the exact command, Ruby version, hardware, and why the result may not generalize.

## Exit Criteria

- You can separate protocol parsing from domain behavior.
- You can inspect source without executing it.
- You can discuss Ruby performance using measurements, runtime behavior, and clearly stated assumptions.
