# frozen_string_literal: true
# SPDX-License-Identifier: MIT

left = "ruby"
right = +"ruby"

puts "left == right: #{left == right}"
puts "left.eql?(right): #{left.eql?(right)}"
puts "left.equal?(right): #{left.equal?(right)}"

puts "1 == 1.0: #{1 == 1.0}"
puts "1.eql?(1.0): #{1.eql?(1.0)}"
puts "String === left: #{String === left}"

