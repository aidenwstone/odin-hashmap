# frozen_string_literal: true

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

  def set(key, value); end

  def get(key); end

  def has?(key); end

  def remove(key); end

  def clear; end

  def keys; end

  def values; end

  def entries; end
end
