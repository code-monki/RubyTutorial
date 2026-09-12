# frozen_string_literal: true
# SPDX-License-Identifier: MIT

require "prism"

path = ARGV.fetch(0, File.expand_path("../../01-object-model-metaprogramming/examples/capability_dsl.rb", __dir__))
result = Prism.parse_file(path)

queue = [result.value]
calls = []

until queue.empty?
  node = queue.shift
  calls << node.name if node.respond_to?(:name) && node.class.name.end_with?("CallNode")
  node.child_nodes.compact.each { |child| queue << child }
end

puts calls.compact.uniq.sort
