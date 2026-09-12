# frozen_string_literal: true
# SPDX-License-Identifier: MIT

module AgentLab
  class Queue
    include Enumerable

    def initialize(values = [])
      @values = values.dup
      @head = 0
    end

    def push(value)
      @values << value
      self
    end

    def pop
      return nil if empty?

      value = @values[@head]
      @head += 1
      compact_if_sparse
      value
    end

    def empty?
      size.zero?
    end

    def size
      @values.length - @head
    end

    def each(&block)
      return enum_for(__method__) unless block

      @head.upto(@values.length - 1) { |index| yield @values[index] }
    end

    private

    def compact_if_sparse
      return unless @head > 32 && @head > @values.length / 2

      @values = @values.drop(@head)
      @head = 0
    end
  end
end
