# Capstone: Is Ruby Attractive For Agent Frameworks And Internal DSLs?

## Thesis To Test

Ruby may be an unusually good language for agent-framework ergonomics because blocks, keyword arguments, open classes, modules, and internal DSLs can express policies and capabilities elegantly.

Ruby may also be a dangerous language for agent-framework internals because the same features can hide control flow, blur boundaries, complicate static analysis, and make runtime behavior too magical.

The capstone is to find out by building something small enough to understand and real enough to criticize.

## Stages

### Stage 1: Message And Transcript

- Use `AgentLab::Message` and `AgentLab::Transcript`.
- Persist JSON.
- Add simple CLI commands.

Judgment question:

- Does Ruby make the data model clearer, or just shorter?

### Stage 2: Capabilities

- Add capability objects.
- Add explicit registration.
- Add tests for unknown capability handling.

Judgment question:

- Is duck typing helping boundaries or hiding contracts?

### Stage 3: Tests, Packaging, Types

- Package the library.
- Add Minitest, then compare one RSpec rewrite.
- Add RBS or Sorbet annotations for the public API.

Judgment question:

- Which contracts belong in tests, types, documentation, or runtime validation?

### Stage 4: Concurrency

- Add a work queue for messages.
- Compare Threads, Fibers, and Ractors conceptually.
- Add cancellation/timeout behavior.

Judgment question:

- Is Ruby pleasant for IO-bound agent orchestration? Where does CPU-bound work leave Ruby?

### Stage 5: DSL

- Add a capability DSL.
- Preserve an explicit non-DSL API.
- Add source locations and validation errors.

Judgment question:

- Does the DSL improve the author's thinking, or merely create cute syntax?

### Stage 6: Networking And Protocols

- Add a line-oriented protocol.
- Serialize messages.
- Add capability restrictions.

Judgment question:

- Does Ruby remain clear once IO, failure, and protocol evolution enter?

### Stage 7: Instrumentation And Runtime

- Add TracePoint or explicit hooks.
- Track allocations.
- Try YJIT and experimental ZJIT.
- Inspect DSL source with Prism.

Judgment question:

- Can you observe the framework well enough to trust it?

## Final Deliverable

Write a short technical memo:

- Where Ruby felt excellent.
- Where Ruby felt risky.
- Which features are framework-grade.
- Which features are demo-grade.
- Whether you would choose Ruby for an internal agent framework in 2026.

