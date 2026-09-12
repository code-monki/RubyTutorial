# frozen_string_literal: true
# SPDX-License-Identifier: MIT

require "set"
require_relative "queue"

module AgentLab
  class Graph
    def initialize(edges = {})
      @edges = Hash.new { |hash, key| hash[key] = [] }
      edges.each { |from, tos| tos.each { |to| add_edge(from, to) } }
    end

    def add_edge(from, to)
      @edges[from] << to
      self
    end

    def neighbors(node)
      @edges.fetch(node, [])
    end

    def breadth_first(start, &block)
      return enum_for(__method__, start) unless block

      seen = Set[start]
      queue = Queue.new([start])

      until queue.empty?
        node = queue.pop
        yield node
        neighbors(node).each do |neighbor|
          next if seen.include?(neighbor)

          seen << neighbor
          queue.push(neighbor)
        end
      end
    end
  end
end
