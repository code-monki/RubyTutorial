# frozen_string_literal: true
# SPDX-License-Identifier: MIT

def label(value)
  value ? "truthy" : "falsey"
end

puts "Truthiness:"
[nil, false, true, 0, "", [], {}].each do |value|
  puts "#{value.inspect.ljust(8)} => #{label(value)}"
end

puts "\nEquality:"
left = "ruby"
right = +"ruby"
puts "left == right: #{left == right}"
puts "left.eql?(right): #{left.eql?(right)}"
puts "left.equal?(right): #{left.equal?(right)}"

puts "\nSymbols and strings:"
hash = { role: "assistant", "role" => "string key" }
puts hash[:role]
puts hash["role"]

puts "\nPattern matching:"
message = { role: "user", content: "Hello" }
case message
in { role: "user", content: String => content }
  puts "user said #{content.inspect}"
else
  puts "not a user message"
end

puts "\nLocal variable parsing:"
def status
  "method status"
end

puts status
status = "local status"
puts status
