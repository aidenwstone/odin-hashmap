# frozen_string_literal: true

# The Node class manages storing key-value pairs along
# with a reference to the next node in the list.
# This class is designed to be used with HashMap.
class Node
  attr_reader :key, :value
  attr_accessor :next_node

  def initialize(key, value, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end
end
