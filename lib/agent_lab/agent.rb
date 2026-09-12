# frozen_string_literal: true
# SPDX-License-Identifier: MIT

require_relative "capability"
require_relative "message"
require_relative "transcript"

module AgentLab
  class Agent
    attr_reader :name, :capabilities, :transcript

    def initialize(name:, capabilities: [], transcript: Transcript.new)
      @name = name
      @capabilities = capabilities.to_h { |capability| [capability.name.to_s, capability] }
      @transcript = transcript
    end

    def receive(content, from: "user")
      transcript.add(Message.new(role: from, content: content))
      self
    end

    def respond(content)
      transcript.add(Message.new(role: "assistant", content: content, metadata: { agent: name }))
      self
    end

    def use(capability_name, input)
      capability = capabilities.fetch(capability_name.to_s) do
        raise KeyError, "unknown capability: #{capability_name}"
      end

      capability.call(input)
    end
  end
end
