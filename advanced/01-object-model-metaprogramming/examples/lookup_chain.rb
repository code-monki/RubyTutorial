# frozen_string_literal: true
# SPDX-License-Identifier: MIT

module Auditable
  def label
    "auditable #{super}"
  end
end

class MessageLike
  prepend Auditable

  def label
    "message"
  end
end

message = MessageLike.new

def message.singleton_note
  "stored on my singleton class"
end

puts message.label
puts message.singleton_note
puts "Class ancestors: #{MessageLike.ancestors.inspect}"
puts "Singleton class ancestors: #{message.singleton_class.ancestors.inspect}"
puts "singleton_note owner: #{message.method(:singleton_note).owner}"
