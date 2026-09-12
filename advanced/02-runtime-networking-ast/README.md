# A4/A5/A6: Runtime, Networking, AST

## What You Will Think Naturally After This Lesson

You will treat Ruby as both a language and a runtime: parseable source, observable execution, networked IO, GC pressure, and JIT tradeoffs.

## Learning Objectives

- Use `Socket`, `Net::HTTP`, `JSON`, `Timeout`, and `OpenSSL` with explicit boundaries.
- Use Prism to inspect Ruby source.
- Use TracePoint, ObjectSpace, GC stats, YJIT/ZJIT flags, and profiling gems judiciously.
- Understand FFI/native extension tradeoffs.

## Exercises

1. Build a line-oriented TCP message echo server.
2. Parse `capability_dsl.rb` with Prism and list method calls.
3. Add TracePoint instrumentation around capability execution.
4. Run a benchmark with and without JIT flags, then write down why the result may not generalize.

## Exit Criteria

- You can separate protocol parsing from domain behavior.
- You can inspect source without executing it.
- You can discuss Ruby performance using measurements, runtime behavior, and clearly stated assumptions.
