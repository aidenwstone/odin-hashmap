# frozen_string_literal: true

require_relative 'node'

# The HashMap class manages a custom implementation of the HashMap data structure.
# It includes methods for calculating hashes, setting and getting values, etc.
class HashMap
  attr_reader :length

  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity)
    @length = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code
  end

  def set(key, value) # rubocop:disable Metrics/MethodLength
    index = hash(key) % @capacity
    head_node = @buckets[index]
    raise IndexError if index.negative? || index >= @buckets.length

    curr_node = head_node
    while curr_node
      if curr_node.key == key
        curr_node.value = value
        return
      end

      curr_node = curr_node.next_node
    end

    @buckets[index] = Node.new(key, value, head_node)
    @length += 1

    if @length > @capacity * @load_factor # rubocop:disable Style/GuardClause
      # TODO: Grow the bucket size
    end
  end

  def get(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length

    curr_node = @buckets[index]
    while curr_node
      return curr_node.value if curr_node.key == key

      curr_node = curr_node.next_node
    end

    nil
  end

  def has?(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length

    curr_node = @buckets[index]
    while curr_node
      return true if curr_node.key == key

      curr_node = curr_node.next_node
    end

    false
  end

  def remove(key) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length

    curr_node = @buckets[index]
    return nil unless curr_node

    if curr_node.key == key
      @buckets[index] = curr_node.next_node
      @length -= 1
      return curr_node.value
    end

    prev_node = nil
    while curr_node
      if curr_node.key == key
        prev_node.next_node = curr_node.next_node
        @length -= 1
        return curr_node.value
      end

      prev_node = curr_node
      curr_node = curr_node.next_node
    end

    nil
  end

  def clear; end

  def keys; end

  def values; end

  def entries; end
end
