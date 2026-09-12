# frozen_string_literal: true
# SPDX-License-Identifier: MIT

require_relative "../../../lib/agent_lab/agent"

class CapabilityBuilder
  attr_reader :capabilities

  def initialize
    @capabilities = []
  end

  def capability(name, description:, &block)
    raise ArgumentError, "capability requires a block" unless block

    capabilities << AgentLab::Capability.new(name: name.to_s, description: description, handler: block)
  end
end

def capabilities(&block)
  builder = CapabilityBuilder.new
  builder.instance_eval(&block)
  builder.capabilities
end

caps = capabilities do
  capability :shout, description: "Uppercase the input" do |input|
    input.to_s.upcase
  end
end

agent = AgentLab::Agent.new(name: "Ada", capabilities: caps)
puts agent.use(:shout, "is this DSL worth it?")
