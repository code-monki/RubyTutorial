# frozen_string_literal: true
# SPDX-License-Identifier: MIT

require "securerandom"
require "time"

module AgentLab
  class Message
    attr_reader :id, :role, :content, :created_at, :metadata

    VALID_ROLES = %w[user assistant tool system].freeze

    def initialize(role:, content:, id: SecureRandom.uuid, created_at: Time.now, metadata: {})
      raise ArgumentError, "role must be one of #{VALID_ROLES.join(', ')}" unless VALID_ROLES.include?(role.to_s)
      raise ArgumentError, "content must not be empty" if content.to_s.strip.empty?

      @id = id
      @role = role.to_s
      @content = content.to_s.freeze
      @created_at = created_at.is_a?(Time) ? created_at : Time.parse(created_at.to_s)
      @metadata = metadata.transform_keys(&:to_s).freeze
      freeze
    end

    def to_h
      {
        "id" => id,
        "role" => role,
        "content" => content,
        "created_at" => created_at.iso8601,
        "metadata" => metadata
      }
    end

    def self.from_h(hash)
      new(
        id: hash.fetch("id"),
        role: hash.fetch("role"),
        content: hash.fetch("content"),
        created_at: hash.fetch("created_at"),
        metadata: hash.fetch("metadata", {})
      )
    end

    def user?
      role == "user"
    end

    def assistant?
      role == "assistant"
    end
  end
end
