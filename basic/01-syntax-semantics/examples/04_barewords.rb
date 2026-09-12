# frozen_string_literal: true
# SPDX-License-Identifier: MIT

def status
  "method status"
end

puts status

status = "local status"
puts status

def greet(name)
  "hello #{name}"
end

puts greet("Ruby")

