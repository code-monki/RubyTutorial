# Ruby Doc Decoder

Ruby documentation often uses compact notation in examples. This page explains the notation that can distract a reader who knows programming but is new to Ruby.

## Output Helpers

### `p`

`p object` prints `object.inspect` followed by a newline, then returns the object.

Use it when you want to see a debugging representation:

```ruby
p ["ruby", nil, :symbol]
# prints: ["ruby", nil, :symbol]
```

Think of it roughly as:

```ruby
$stdout.write(object.inspect, "\n")
```

The actual implementation handles multiple arguments and return values, but this model is good enough when reading examples.

### `puts`

`puts object` prints a human-oriented string representation followed by a newline.

```ruby
puts ["ruby", nil, :symbol]
```

This prints each array element on its own line. That is different from `p`, which prints the array representation.

### `print`

`print object` writes the string representation without automatically adding a newline.

## Example Result Comments

### `#=>`

Ruby docs often use `#=>` in comments to show the value of an expression.

```ruby
1 + 2 #=> 3
```

The `#` starts a comment. The `=>` is not executed here; it is just documentation convention.

## Method Name Notation

### `Class#method`

`String#upcase` means an instance method named `upcase` on instances of `String`.

```ruby
"ruby".upcase
```

### `Class.method` or `Class::method`

`File.read` means a method called on the `File` object itself.

```ruby
File.read("README.md")
```

Ruby docs may also use `::` for class/module methods. In ordinary application code, prefer `.` for method calls unless you are referring to constants or namespaces.

### `Module::Constant`

`Math::PI` means constant `PI` inside module `Math`.

```ruby
Math::PI
```

## `=>` Has Multiple Meanings

### Hash Rocket

In a hash literal, `=>` separates a key from a value:

```ruby
{ "role" => "user" }
```

Modern Ruby usually uses this shorter syntax for symbol keys:

```ruby
{ role: "user" }
```

### Pattern Binding

In pattern matching, `=>` can bind a matched value to a local variable:

```ruby
case { role: "user", content: "Hello" }
in { content: String => content }
  puts content
end
```

Here `String => content` means: match a `String`, then assign the matched value to local variable `content`.

### Standalone Pattern Match

Ruby also supports standalone pattern matching:

```ruby
message => { role: role, content: String => content }
```

This checks that `message` matches the pattern. If it does, Ruby binds `role` and `content`. If it does not, Ruby raises `NoMatchingPatternError`.

## Common Example Methods

### `inspect`

`inspect` returns a debugging representation of an object.

```ruby
"ruby".inspect #=> "\"ruby\""
```

### `to_s`

`to_s` returns a string representation intended for display or interpolation.

```ruby
"ruby".to_s #=> "ruby"
```

### `pp`

`pp` pretty-prints objects. It is useful for nested arrays, hashes, and objects.

```ruby
pp({ role: "user", content: ["hello", "ruby"] })
```

## Reading Advice

When official docs use shorthand, translate it into the longer form once, then keep reading. The goal is not to memorize every notation immediately. The goal is to avoid mistaking documentation shorthand for a new language feature.

