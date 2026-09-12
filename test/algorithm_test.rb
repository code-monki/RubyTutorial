# frozen_string_literal: true
# SPDX-License-Identifier: MIT

require "minitest/autorun"
require_relative "../labs/algorithms/quicksort"
require_relative "../labs/algorithms/graph"

class AlgorithmTest < Minitest::Test
  def test_quicksort_preserves_duplicates
    values = [3, 1, 2, 3, 1]

    assert_equal [1, 1, 2, 3, 3], AgentLab::Algorithms.quicksort(values)
  end

  def test_quicksort_accepts_block_comparator
    values = %w[ruby c haskell go]

    sorted = AgentLab::Algorithms.quicksort(values) { |left, right| left.length <=> right.length }

    assert_equal %w[c go ruby haskell], sorted
  end

  def test_graph_breadth_first_returns_enumerator
    graph = AgentLab::Graph.new("inbox" => %w[classifier archive], "classifier" => ["tool"])

    assert_equal %w[inbox classifier archive tool], graph.breadth_first("inbox").to_a
  end
end
