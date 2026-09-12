# frozen_string_literal: true
# SPDX-License-Identifier: MIT

message = { role: "user", content: "Hello" }

# In a pattern, `String => content` means:
# match a String, then bind the matched value to the local variable `content`.
case message
in { role: "user", content: String => content }
  puts "user said #{content.inspect}"
in { role: "assistant", content: String => content }
  puts "assistant said #{content.inspect}"
else
  puts "unknown message shape"
end

message => { role: role, content: String => content }
puts "standalone pattern binding: role=#{role.inspect}, content=#{content.inspect}"
