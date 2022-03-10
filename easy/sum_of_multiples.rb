=begin

Problem
---------------
input = integer provided to #to method and list of integers given to #new
output = sum of multiples

problem domain = take the value provided to the #to method and use that as the limit for multiples to find. If no list values are given when instaniating an object or if the class method is called use default 3 and 5. Find all mutliples up to the given number and sum the values.

implicit requirments = N/A
explicit requirements = class method called #to and instance method #to, default values when no list proivded is 3 and 5, return integer, arguments passed in when instaniating a new object can be one or more, initial number provided should be less than not equal to or including initial number.

mental model = class method: use default values 3 and 5, take number and increment down to checking if the values provided have any remainders when dividing, need to somehow pass a block mutliple arguments.
  Iterate down from the inital number...
  Check each argument is divisble into current iteration (probably iterate through array)
  Add to sum if true for one of the numbers in list.

Examples
---------------
20 = 3, 5, 6, 9, 10, 12, 15, 18 = 78

Data Structue
---------------
Array

Algorithm
---------------
create class SumOfMultiples
create class method #to
pass values 3 and 5 to instance method
create #to method
iterate down from number
- check if value in arugment array is multiple
- if yes add to sum
- if not check next element in argument array
contiue onto next increment
return sum

Code
---------------
=end

class SumOfMultiples
  attr_reader :list
  
  def initialize(*list)
    @list = list
  end

  def self.to(max)
    SumOfMultiples.new(3, 5).to(max)
  end

  def to(max)
    sum = 0
    
    (max - 1).downto(1) do |number|
      if list.any? { |n| number % n == 0 }
        sum += number
      end
    end
    
    sum
  end
end