# frozen_string_literal: true
# SPDX-License-Identifier: MIT

message = { role: "user", content: "Hello" }

case message
in { role: "user", content: String => content }
  puts "user said #{content.inspect}"
in { role: "assistant", content: String => content }
  puts "assistant said #{content.inspect}"
else
  puts "unknown message shape"
end

