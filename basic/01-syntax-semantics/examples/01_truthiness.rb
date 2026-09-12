# frozen_string_literal: true
# SPDX-License-Identifier: MIT

def truth_label(value)
  value ? "truthy" : "falsey"
end

[nil, false, true, 0, "", [], {}].each do |value|
  puts "#{value.inspect.ljust(8)} => #{truth_label(value)}"
end

