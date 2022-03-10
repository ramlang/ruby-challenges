=begin

Problem
---------------
input = integer
output = string

problem domain = write a program that can tell whether a number is perfect, abundant, or deficient. Prime numbers are always deficient. Using the sum of the divisors of a number determine what type of number it is.

implicit requirments = N/A
explicit requirments = raise a standard error if a number is less than zero, create a class method called classify, all prime numbers are deficient.

mental model = create number validation and raise error if negative number or not a number. Take number and increment down dividing it starting at half of the original number. if there is a remainder skip the number if there is no remainder keep the number. return an array of numbers and sum. or use reduce or inject to find the cumulative sum.

Examples
---------------
6 = perfect (1 + 2 + 3 = 6)
15 = deficient (1 + 3 + 5 = 9)
24 = abundant (1 + 2 + 3 + 4 + 6 + 8 + 12 = 36)

Data Structure
---------------
none

Algorithm
---------------
Create class PerfectNumber
Create class method classify that accepts one argument
Determine if number is valid
- check if greater than 0
- check if number (#to_s.to_i)
Take argument and divide by two
Iterate using downto method
take argument number and divdie by current iteration
if remainder keep number if not skip
sum numbers
return string

Code
---------------
=end

class PerfectNumber
  attr_reader :number
  
  def initialize(number)
    @number = number
  end
  
  def self.classify(number)
    raise StandardError.new unless number > 0
    
    list = []
    (number / 2).downto(1) do |divisor|
      quotient, remainder = number.divmod(divisor)
      list << divisor if remainder == 0
    end
    
    if list.sum == number
      'perfect'
    elsif list.sum > number
      'abundant'
    elsif list.sum < number
      'deficient'
    end
  end
end
  
# solution
class PerfectNumber
  def self.classify(number)
    raise StandardError.new if number < 1
    sum = sum_of_factors(number)

    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end

  class << self
    private

    def sum_of_factors(number)
      (1...number).select do |possible_divisor|
        number % possible_divisor == 0
      end.sum
    end
  end
end