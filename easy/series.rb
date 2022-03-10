=begin

Problem
---------------
input = string of digits and specified length
output = nested array of consecutive numbers

problem domain = Write a program that will take a string of digits and return all the possible consectuive number series of a specified length. Basically separate the string return slices of the number that match the length specified, returning every possible consecutive grouping if the number was to be sliced by the specified legnth.

implicit requirments = N/A
explicit requirments = create a series class, create a slices method, return a nested array, elements in returned array should be integers, an argument error should be raised if specified length is longer than string length

mental model = take the string, separate into an array of characters, iterate over the array and transform the char into integers, iterate using each cons to return a collection and make it into an array, somehow make it a nested array

Examples
---------------
"01234" has the following 3-digit series...
012, 123, 234

and the folling 4-digit series...
0123
1234

Data Structure
---------------
Array
Nested Array

Algorithm
---------------
Create a series class
Create an initialize method that takes a string argument
Create a slices instance method that accepts one integer arugment
Use chars to separate the string into an array of characters
Iterate over characters aarray with map and call to_i on each char
Iterate over the integer array with each cons
add to result array
return a nested array 

Code 
---------------
=end

# class Series
#   attr_reader :string
  
#   def initialize(string)
#     @string = string
#   end
  
#   def slices(length)
#     raise ArgumentError unless length <= string.length
#     list = []
#     integer_array.each_cons(length) do |arr|
#       list << arr
#     end
#     list    
#   end
  
#   def integer_array
#     string.chars.map(&:to_i)
#   end
# end

# solution
# class Series
#   attr_accessor :str

#   def initialize(str)
#     @number_string = str
#   end

#   def slices(length)
#     raise ArgumentError.new if length > number_string.size
#     number_string.chars.map(&:to_i).each_cons(length).to_a
#   end
# end
class Series
  def initialize(string)
    @string = string
  end

  def slices(size)
    raise ArgumentError if size > @string.size
    result = []
    idx = 0
    while idx <= @string.size - size
      puts size
      p @string.chars[idx, size]
      result << @string.chars[idx, size].map(&:to_i)
      idx += 1
    end
    result
  end
end