# frozen_string_literal: true

# The Node class manages storing key-value pairs along
# with a reference to the next node in the list.
# This class is designed to be used with HashMap.
class Node
  attr_reader :key
  attr_accessor :value, :next_node

  def initialize(key, value, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end

  def inspect
    "(#{@key}: #{@value.inspect}) -> #{@next_node.inspect}"
  end
end
