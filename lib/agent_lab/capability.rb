# frozen_string_literal: true
# SPDX-License-Identifier: MIT

module AgentLab
  Capability = Data.define(:name, :description, :handler) do
    def call(input)
      handler.call(input)
    end
  end
end
