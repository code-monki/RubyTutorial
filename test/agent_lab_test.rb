# frozen_string_literal: true
# SPDX-License-Identifier: MIT

require "minitest/autorun"
require "tempfile"
require_relative "../lib/agent_lab/agent"

class AgentLabTest < Minitest::Test
  def test_message_validation
    error = assert_raises(ArgumentError) do
      AgentLab::Message.new(role: "observer", content: "hello")
    end

    assert_match(/role must be/, error.message)
  end

  def test_transcript_is_enumerable
    transcript = AgentLab::Transcript.new
      .add(AgentLab::Message.new(role: "user", content: "Hello Ruby"))
      .add(AgentLab::Message.new(role: "assistant", content: "Hello again"))

    assert_equal %w[user assistant], transcript.map(&:role)
    assert_equal 2, transcript.word_tally.fetch("hello")
  end

  def test_transcript_round_trip
    Tempfile.create("agent-lab") do |file|
      transcript = AgentLab::Transcript.new
        .add(AgentLab::Message.new(role: "user", content: "persist me"))

      transcript.save(file.path)
      loaded = AgentLab::Transcript.load(file.path)

      assert_equal ["persist me"], loaded.map(&:content)
    end
  end

  def test_agent_capability
    capability = AgentLab::Capability.new(
      name: "reverse",
      description: "Reverse text",
      handler: ->(input) { input.to_s.reverse }
    )

    agent = AgentLab::Agent.new(name: "Ada", capabilities: [capability])

    assert_equal "ybuR", agent.use(:reverse, "Ruby")
  end
end
