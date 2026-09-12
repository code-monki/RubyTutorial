# Curriculum

## Design Principles

This curriculum defines Basic, Intermediate, and Advanced by depth of Ruby understanding, not by generic computer science difficulty.

- Basic Ruby: syntax, semantics, mental parsing, small command-line programs.
- Intermediate Ruby: substantial idiomatic programs, tests, packaging, optional types, performance, concurrency, and selected algorithm/data-structure labs.
- Advanced Ruby: the object model as machinery, metaprogramming, DSLs, runtime instrumentation, parser/AST work, networking, native boundaries, GC/JIT, and capability design.

Modern/Idiomatic Ruby is vertical. Every level asks whether the obvious code, the idiomatic code, the optimized code, and the library code are saying the same thing, and what they cost.

## Continuing Project: Agent Lab

The project deliberately avoids the web at first.

Basic form:

- Represent actors, messages, transcripts, and a tiny CLI.
- Persist transcript data as JSON.
- Keep IO and domain logic separate.

Intermediate form:

- Add custom collections, Enumerable queries, tests, packaging, optional type signatures, background work, queues, caching, benchmarking, and plugin-like capabilities.

Advanced form:

- Add a small internal DSL for declaring tools and policies.
- Add method hooks and instrumentation.
- Explore Fiber/Ractor boundaries.
- Add socket-based protocol experiments.
- Use Prism to inspect DSL files.
- Decide whether Ruby is attractive for agent frameworks and internal DSLs.

The answer may be conditional. Ruby is strong at internal DSLs and human-oriented APIs, but those same features can hide control flow, dependency boundaries, and side effects. The capstone should evaluate both outcomes directly.

## Basic Ruby

### B1. Reading Ruby Again: Syntax, Calls, Literals, And Control Flow

Natural thought after the lesson: "I can parse Ruby source directly instead of mentally parenthesizing it into another language."

Objectives:

- Rebuild familiarity with method-call syntax, optional parentheses, blocks, literals, ranges, symbols, hashes, keyword arguments, safe navigation, endless methods, pattern matching basics, and exception shape.
- Identify ambiguity between local variables and zero-argument method calls.
- Practice writing K&R-sized examples that reveal language behavior.

Exit criteria:

- You can predict receiver, arguments, block binding, and return value for small snippets.
- You can explain Ruby truthiness: only `nil` and `false` are falsey.
- You can identify when compact punctuation makes code harder to read.

Polyglot traps:

- `0`, `""`, `[]`, and `{}` are truthy.
- `return` inside blocks, procs, and lambdas has different consequences.
- Hash string keys and symbol keys are different unless a framework layer says otherwise.
- Parentheses are optional, but ambiguity is not free.

Code reading:

- Read `OptionParser` examples from Ruby's standard library docs.
- Skim Ruby's `Enumerable` docs before writing your own loops.

### B2. Blocks, Procs, Lambdas, And Binding

Natural thought after the lesson: "A block is not just an anonymous function; it is Ruby's control abstraction currency."

Objectives:

- Compare block, `Proc`, lambda, method object, and `&` conversion.
- Understand arity, `return`, closure capture, and block-local variables.
- Use blocks to design small APIs without ceremony.

Exit criteria:

- You can decide when an API should accept a block, return an Enumerator, or take an object.
- You can explain lambda/proc arity and return behavior.
- You can avoid callback-shaped code when a simple object would be clearer.

Design warning:

- Block-based APIs can make control flow hard to see. Use blocks when they make the caller's intent clearer, and avoid using them to hide policy or side effects inside a method call.

Practice:

- Return to `basic/02-cli-agent-log/examples/agent_log.rb` and add a `search TERM` command that prints messages whose content includes `TERM`.

### B3. Small CLI Programs With Standard Library

Natural thought after the lesson: "I can build useful Ruby scripts without reaching for Rails-shaped habits."

Objectives:

- Use `OptionParser`, `JSON`, `Pathname`, `FileUtils`, `Tempfile`, `Time`, `SecureRandom`, `Shellwords`, and `Open3`.
- Separate parsing, domain logic, and side effects.
- Build the first `agent_log` CLI.

Exit criteria:

- You can add/list transcript messages from the command line.
- You can keep the code small without making it a pile of globals.
- You know when a gem solves a real problem and when the standard library is enough.

## Intermediate Ruby

### I1. Enumerable, Custom Iterators, And Collection Design

Natural thought after the lesson: "I can make my own objects participate in Ruby collection idioms without surprising callers."

Objectives:

- Implement `each`, include `Enumerable`, and return `enum_for` when no block is given.
- Use `map`, `filter_map`, `flat_map`, `partition`, `group_by`, `tally`, `chunk_while`, `slice_when`, and `lazy`.
- Compare loops, idiomatic chains, optimized variants, and library support.

Exit criteria:

- Your transcript collection can be queried through `Enumerable`.
- You can explain when an Enumerable chain allocates avoidably.
- You can write an iterator that behaves like a good Ruby citizen.

Practice:

- Rewrite the `agent_log` search command with `Enumerable#select`.
- After reading `Enumerator::Lazy`, write down how a lazy transcript search would change memory use for a very large transcript.

Algorithm labs:

- Stack/queue/deque: objective is object API shape, mutation boundaries, and Enumerable participation.
- Quicksort: objective is block comparators, partitioning, recursion style, and allocation awareness.
- Graph traversal: objective is set/hash semantics, queue design, block-yield APIs, and enumerator composition.

### I2. Object Modeling, Value Objects, Modules, And Errors

Natural thought after the lesson: "I can model Ruby objects around messages and protocols instead of class hierarchies imported from elsewhere."

Objectives:

- Use small classes, `Struct`/`Data` where appropriate, modules for namespace and mixins, and explicit error types.
- Understand `attr_reader`, freezing, mutation contracts, equality, and pattern matching hooks.
- Avoid overusing inheritance.

Exit criteria:

- You can justify whether an agent concept should be a class, module, value object, callable object, or plain hash.
- You can define equality intentionally.
- You can name which objects are allowed to mutate.

Practice:

- Create a small value object with one attribute. Compare two instances before defining `==`, then define `==` and compare the result.

Design warning:

- Ruby makes it easy to reopen classes, pass flexible objects, and defer checks until runtime. Use explicit boundaries, small public APIs, and tests because the language will not enforce those choices for you.

### I3. Testing Architecture

Natural thought after the lesson: "I can use tests to pin Ruby behavior, not just application behavior."

Objectives:

- Use Minitest first because it ships with Ruby.
- Survey RSpec as a widely used behavior/spec DSL.
- Learn test helpers, fixtures, fake IO, temporary files, and contract-like tests for duck-typed objects.

Exit criteria:

- You can test the CLI edge separately from the message model.
- You can write tests that document tricky Ruby semantics.
- You can avoid mocks that make dynamic behavior harder to understand than the production code.

### I4. Packaging, Gems, Bundler, And Project Shape

Natural thought after the lesson: "I know what Ruby's package machinery is doing before I blame load paths."

Objectives:

- Use `Gemfile`, `Gemfile.lock`, `bundle exec`, gemspecs, executable bins, semantic versioning, default gems, bundled gems, and dependency groups.
- Build `agent_lab` into a small gem-like package.
- Understand `require`, `autoload`, load paths, constants, and file naming conventions.

Exit criteria:

- You can explain why `require` fails.
- You can create a gem skeleton and know which files matter.
- You can distinguish app dependency management from library dependency constraints.

Practice:

- Convert `agent_lab` into a minimal gem skeleton while keeping the curriculum repository readable.

### I5. Optional Typing: RBS, Steep, Sorbet

Natural thought after the lesson: "I can use types as documentation and guardrails without pretending Ruby became Java."

Objectives:

- Write small RBS signatures for the message model.
- Survey Steep as an RBS-oriented checker and Sorbet as a production-proven gradual type checker with runtime signatures.
- Understand that Ruby type tooling is optional, plural, and culturally uneven.

Exit criteria:

- You can add signatures for stable public APIs.
- You can decide when annotations clarify boundaries versus fight the language.
- You can explain the tradeoff between RBS files and inline Sorbet signatures.

### I6. Concurrency: Threads, Fibers, Async Shape, Ractors

Natural thought after the lesson: "I can choose a Ruby concurrency model by workload and isolation need."

Objectives:

- Understand threads, Mutex/Queue, Fibers, Fiber Scheduler ecosystem ideas, Ractors, and process-level concurrency.
- Use concurrent message processing as a lab.
- Separate IO concurrency from CPU parallelism.

Exit criteria:

- You can build a worker queue safely with standard library primitives.
- You can explain why CPU-bound Ruby code and IO-bound Ruby code behave differently.
- You can say when Ractor isolation is worth the friction.

### I7. Performance, Allocation, Profiling, And Benchmarking

Natural thought after the lesson: "I can see when Ruby elegance allocates and when that matters."

Objectives:

- Use `Benchmark`, `GC.stat`, `ObjectSpace`, `stackprof`/`memory_profiler` survey, and YJIT/ZJIT awareness.
- Compare obvious, idiomatic, optimized, and library approaches.
- Learn that microbenchmarks often fail to predict real application behavior. Use allocation counts and focused profiling as supporting evidence, not as the whole argument.

Exit criteria:

- You can benchmark transcript queries responsibly.
- You can identify allocation-heavy Enumerable chains.
- You can decide whether optimization belongs in Ruby, a gem, native code, or nowhere.

## Advanced Ruby

### A1. Object Model: Method Lookup, Eigenclasses, Constants

Natural thought after the lesson: "I can predict where Ruby will look next."

Objectives:

- Understand singleton classes, eigenclasses, method tables, ancestors, `prepend`, `include`, `extend`, constant lookup, `const_missing`, `method_missing`, and refinements.
- Debug lookup chains so method behavior is visible and predictable.

Exit criteria:

- You can explain why a singleton method does not live on the object itself.
- You can predict module precedence with `prepend` versus `include`.
- You can spot constant lookup bugs before they become recurring production issues.

### A2. Metaprogramming, Hooks, Reflection, And Monkey-Patching

Natural thought after the lesson: "I can use Ruby's dynamism to generate controlled interfaces without making runtime behavior hard to trace."

Objectives:

- Use `define_method`, `class_eval`, `instance_eval`, `method_added`, `included`, `extended`, TracePoint, and reflection APIs.
- Build a minimal capability DSL for the agent project.
- Compare explicit registration with DSL-based registration, including how each affects readability, validation, and debugging.

Exit criteria:

- You can construct a DSL and then argue against it.
- You can instrument method calls without corrupting the program.
- You can explain why monkey-patching requires ownership, locality, and tests.

### A3. DSL Construction

Natural thought after the lesson: "I can design Ruby APIs that read well while preserving debuggability."

Objectives:

- Build internal DSLs with blocks, builder objects, keyword arguments, and explicit return values.
- Avoid `instance_eval` until the ergonomics justify the loss of lexical clarity.
- Design failure messages and source-location reporting.

Exit criteria:

- Your capability DSL can declare tools, inputs, policies, and execution handlers.
- You can show the equivalent non-DSL API.
- You can reject a DSL when a plain object graph is clearer.

### A4. Networking, Protocols, And Capabilities

Natural thought after the lesson: "I can use Ruby for protocol-shaped programs while keeping IO, parsing, and domain behavior separate."

Objectives:

- Use `Socket`, `TCPServer`, `Net::HTTP`, `URI`, `JSON`, `OpenSSL`, and timeouts.
- Build a small line-oriented protocol for agent messages.
- Add capability boundaries and serialization contracts.

Exit criteria:

- You can write a tiny server/client pair.
- You can distinguish protocol parsing from agent behavior.
- You can name timeout, backpressure, and deserialization hazards.

Practice:

- Build a line-oriented TCP echo server for agent messages.

### A5. AST, Parser Work, And Static Analysis

Natural thought after the lesson: "I can inspect Ruby source as data using contemporary parser tools."

Objectives:

- Use Prism for parsing/lexing.
- Survey Ripper as older standard-library AST exposure.
- Inspect DSL files and detect declarations that are ambiguous, incomplete, or unsupported.

Exit criteria:

- You can parse a Ruby file and walk selected nodes.
- You can explain when source analysis beats runtime hooks.
- You can connect parser work to RuboCop-style tooling.

### A6. Runtime, GC, JIT, FFI, And Native Interfaces

Natural thought after the lesson: "I can reason about CRuby as an implementation with costs and escape hatches."

Objectives:

- Study CRuby execution model, GC basics, ObjectSpace, TracePoint costs, YJIT, experimental ZJIT, C extensions, Fiddle/FFI, and native gem tradeoffs.
- Decide when Ruby should call native code rather than become native code.

Exit criteria:

- You can run Ruby with JIT flags and interpret high-level results cautiously.
- You can explain why native extensions complicate packaging.
- You can make a principled call on Ruby for agent framework internals.

Practice:

- Run one benchmark with and without JIT flags. Record the exact command, Ruby version, hardware, and why the result may not generalize.

## Ecosystem Survey

Core and standard library:

- `Enumerable`, `Enumerator`, `Set`, `TSort`, `OptionParser`, `JSON`, `Pathname`, `FileUtils`, `Tempfile`, `Time`, `SecureRandom`, `Socket`, `Net::HTTP`, `OpenSSL`, `Coverage`, `TracePoint`, `ObjectSpace`, `Prism`, `Ripper`.

Tooling:

- Bundler/RubyGems, Minitest, RSpec, RuboCop, SimpleCov, RBS, Steep, Sorbet, Yard, benchmark-ips, stackprof, memory_profiler.

Frameworks and libraries to survey without centering:

- Rails, Hanami, Sinatra, Rack, Sidekiq, Sequel/ROM, Dry-rb, Zeitwerk, concurrent-ruby, Async, Faraday, Nokogiri, Oj, Roda.

Code-reading pool:

- Ruby standard library: `Enumerable`, `OptionParser`, `TSort`, `Net::HTTP`, `Prism` docs/source.
- Respected gems: RuboCop AST patterns, RSpec expectations/mocks internals, Sidekiq job shape, Rack interface, Dry::Struct/Dry::Validation, Zeitwerk autoloading.
- The Odin Project: use selected exercises for repetition and contrast, especially custom enumerables, linked list/hash map/tree labs, recursion, and testing projects. Do not follow it sequentially; it is too beginner-paced for this learner.
