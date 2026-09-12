# frozen_string_literal: true
# SPDX-License-Identifier: MIT

require "json"
require "pathname"
require_relative "message"

module AgentLab
  class Transcript
    include Enumerable

    attr_reader :messages

    def initialize(messages = [])
      @messages = messages.dup
    end

    def each(&block)
      return enum_for(__method__) unless block

      messages.each(&block)
    end

    def add(message)
      messages << message
      self
    end

    def by_role(role)
      select { |message| message.role == role.to_s }
    end

    def word_tally
      flat_map { |message| message.content.downcase.scan(/[a-z][a-z']*/) }.tally
    end

    def to_h
      { "messages" => messages.map(&:to_h) }
    end

    def save(path)
      Pathname(path).write(JSON.pretty_generate(to_h))
      self
    end

    def self.load(path)
      pathname = Pathname(path)
      return new unless pathname.exist?

      data = JSON.parse(pathname.read)
      new(data.fetch("messages", []).map { |row| Message.from_h(row) })
    end
  end
end
