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

1. Add `--role assistant` validation at the CLI boundary before constructing `Message`.
2. Add a `stats` command that prints count by role.
3. Add a `search TERM` command using `Enumerable#grep` or `filter`.

## Exit Criteria

- You can keep CLI parsing separate from the library.
- You can explain why `Message` freezes its content and metadata.
- You can add a command without turning the file into framework-shaped sludge.

