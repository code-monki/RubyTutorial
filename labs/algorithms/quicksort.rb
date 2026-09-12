# frozen_string_literal: true
# SPDX-License-Identifier: MIT

module AgentLab
  module Algorithms
    module_function

    def quicksort(values, &comparison)
      comparison ||= ->(left, right) { left <=> right }
      return values.dup if values.length < 2

      pivot = values.fetch(values.length / 2)
      lower = []
      equal = []
      higher = []

      values.each do |value|
        case comparison.call(value, pivot)
        when -Float::INFINITY...0 then lower << value
        when 0 then equal << value
        else higher << value
        end
      end

      quicksort(lower, &comparison) + equal + quicksort(higher, &comparison)
    end

    def idiomatic_sort(values, &comparison)
      values.sort(&comparison)
    end
  end
end
