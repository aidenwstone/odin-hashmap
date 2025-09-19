# frozen_string_literal: true

require_relative 'lib/hash_map'

test = HashMap.new

puts 'Populate the HashMap:'
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
puts test

puts "\nOverwrite some values:"
test.set('apple', 'green')
test.set('grape', 'green')
test.set('ice cream', 'pink')
puts test

puts "\nExceed load factor:"
test.set('moon', 'silver')
puts test

puts "\nTest other methods:"
puts "get('dog') returns: #{test.get('dog')}"
puts "has?('lion') returns: #{test.has?('lion')}"
puts "remove('frog' returns: #{test.remove('frog')})"
puts "length returns: #{test.length}"
puts "keys returns: #{test.keys}"
puts "values returns: #{test.values}"
puts "entries returns: #{test.entries}"
