# frozen_string_literal: true
# SPDX-License-Identifier: MIT

require_relative "../../../lib/agent_lab/transcript"

transcript = AgentLab::Transcript.new
  .add(AgentLab::Message.new(role: "user", content: "sort these messages"))
  .add(AgentLab::Message.new(role: "assistant", content: "I will group them by role"))
  .add(AgentLab::Message.new(role: "tool", content: "group_by completed"))

puts "Roles:"
puts transcript.map(&:role)

puts "\nGrouped:"
pp transcript.group_by(&:role).transform_values(&:count)

puts "\nWords appearing more than once:"
pp transcript.word_tally.filter { |_word, count| count > 1 }

puts "\nEnumerator returned when no block is given:"
pp transcript.each.class
