# frozen_string_literal: true
# SPDX-License-Identifier: MIT

message = { role: "assistant", "role" => "string key" }

puts "symbol key: #{message[:role]}"
puts "string key: #{message["role"]}"

begin
  message.fetch(:missing)
rescue KeyError => error
  puts "fetch reports missing keys: #{error.class}"
end

