=begin

Problem
---------------
input = octal string
output = decimal integer

problem domain = implement octal to decimal conversion. Treat invalid input as octal 0. Implement conversion, do not use any built in or library methods to do the necessary conversions.
  Basically I am given a base 8 number and I need to convert the base 8 to a base 10 number.

octal numbers
233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64 + 3*8 + 3*1
= 128 + 24 + 3
= 155

decimal
233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100 + 3*10 + 3*1

n*th* digit gets multiplied by 8^n-1

implicit requirements = N/A
explicit requirments = no using built in methods, invalid input is octal 0, input is a string octal number

mental model = take string integer and separate into array of characters. Iterate over the array and make char into integers. Iterate starting at 0 up to size of the array and sum the octal numbers. return the value

Examples
---------------
'1' = 1
'10' = 8
'15' = 17

Data Structure
---------------
Array of characters
Array of integers

Algorithm
---------------
Create Octal class
Create instance method to_decimal
- validate the string is a valid number
-> check by...to_i/to_s
-> if number == 8 return zero
-> return 0 for invalid numbers
- iterate over the number as an array of characters
- change each character into a number upon iteration
- mutliply by 8 raised to the power of array size - index
- add value to cumulative sum
- return sum


Code
---------------
=end

class Octal
  attr_reader :string
  
  def initialize(string)
    @string = string
    @number = string.to_i
  end

  def to_decimal
    n = 0
    sum = 0
    string.chars.reverse_each do |chr|
      return 0 unless chr.match?(/[0-7]/)
      sum += chr.to_i * 8**n
      n += 1
    end
    
    sum
  end
end

# solution
class Octal
  attr_reader :number

  def initialize(str)
    @number = str
  end

  def to_decimal
    return 0 unless valid_octal?(number)

    arr_digits = number.to_i.digits

    new_number = 0
    arr_digits.each_with_index do |num, exponent|
      new_number += (num * (8 ** exponent))
    end

    new_number
  end

  private

  def valid_octal?(num)
    num.chars.all? {|n| n =~ /[0-7]/}
  end
end