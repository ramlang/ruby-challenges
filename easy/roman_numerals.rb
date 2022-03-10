=begin

Problem
---------------
input = integer
output = string that represents roman numerals

problem domain = write code that converts modern decimal numbers into their Roman number equivalents. Letters are I, V, X, L, C, D, M. No need to convert numbers over 3000.
  I => 1
  V => 5
  X => 10
  L => 50
  C => 100
  D => 500
  M => 1000
  
implicit requirements =
explicit requirements = input is an integer and the output should be a string

mental model = take integer value and divide/modulus it to get values separated (2008 / 1000 / 1000 / 8). Iterate over collection and determine which values to add to result string. Repeatedly add letter when needed before moving on to the next one. Return the result string.
  number to include in hash:
  I => 1
  IV => 4
  V => 5
  IX => 9
  X => 10
  XL => 40
  L => 50
  LC => 90
  C => 100
  CD => 400
  D => 500
  DM => 900
  M => 1000
  
Examples
---------------
1990
1000=M
900=CM
90=XC

2008
2000=MM
8=VIII

Data Structure
---------------
Hash collection for converting integers to letters

Algorithm
---------------
Create a RomanNumeral class
Create a constant DECIMAL_TO_ROMAN_NUMERAL and assign it to hash with conversions of integers to letters listed above in mental model
Create an initialize method that accepts an integer argument
Assign the integer argument to an instance variable @number
Create a #to_roman instance method
Create a local variable roman_numeral and assign to ''
Iterate over the DECIMAL_TO_ROMAN_NUMERAL hash and divide the first value into the @numbers variable
Keep track of remainder and the number after division
If the remainder is not zero add the letter equivalent to the roman_numeral string.
If the remainder is greater than 1 multiply the letter by the value before adding it.
If the remainder is zero do not add and move on to the next element in the collection.
Once finished iteratring through the collection return the roman numeral string

Code
---------------
=end

class RomanNumeral
  attr_accessor :number

  DECIMAL_TO_ROMAN_NUMERAL = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }
  
  def initialize(number)
    @number = number
  end
  
  def to_roman
    roman_numeral = ''
    
    DECIMAL_TO_ROMAN_NUMERAL.each do |numeric_value, string|
      quotient, modulus = number.divmod(numeric_value)
      roman_numeral << (string * quotient) if quotient > 0
      self.number = modulus
    end
    
    roman_numeral
  end
end
