# B3: Small CLI Programs With Standard Library

## What You Will Think Naturally After This Lesson

You will be able to build a useful Ruby command-line program with standard library tools and small domain objects.

## Learning Objectives

- Use `OptionParser`, `JSON`, `Pathname`, and small objects.
- Keep IO at the edge and domain logic in testable classes.
- Practice keyword arguments and object initialization.

## Run

```sh
ruby -Ilib basic/02-cli-agent-log/examples/agent_log.rb --help
ruby -Ilib basic/02-cli-agent-log/examples/agent_log.rb --file /tmp/agent.json add --role user "Hello Ruby"
ruby -Ilib basic/02-cli-agent-log/examples/agent_log.rb --file /tmp/agent.json list
```

## Exercises

1. In `agent_log.rb`, add a CLI-level check that rejects `add` when no message content is provided. Print a clear error and exit without writing the file.
2. Add a `stats` command that loads the transcript and prints one count per role.

## Exit Criteria

- You can keep CLI parsing separate from the library.
- You can explain why `Message` freezes its content and metadata.
- You can add a command while keeping parsing, validation, domain logic, and file IO in separate sections or objects.
