# frozen_string_literal: true
# SPDX-License-Identifier: MIT

require "objspace"
require_relative "../../../lib/agent_lab/transcript"

transcript = AgentLab::Transcript.new
100.times do |index|
  transcript.add(AgentLab::Message.new(role: index.even? ? "user" : "assistant", content: "Ruby blocks allocate objects too"))
end

GC.start
before = GC.stat(:total_allocated_objects)
transcript.word_tally
after = GC.stat(:total_allocated_objects)

puts "Objects allocated during word_tally: #{after - before}"
puts "Next: add Transcript#word_tally_single_pass, measure it here, and compare allocations."
