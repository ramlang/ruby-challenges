=begin

Problem
---------------
input = single letter string
output = diamond shape made out of letters

promblem domain = given a letter print a diamond starting with 'A' with the supplied letter at the widest point.

requirements =
  first and last row contain 'A'
  all rows except first and last have two identical letters
  the diamond is horizontally symmetric
  the diamond is vertically symmetric
  the diamond has a sqaure shape
  top half has the letters in ascending order
  bottom half has the letters in descending order
  four corners containing spaces are triangles
  
mental model = create an array of the alphabet to iterate over when creating the diamond, find the total width and hieght of the the grid the triangle will be in, divide the value in half to get half the height and width, the first row should be spaces * half the distance + 1 (to account for the letter), the next row should be half value + 1, letter, 1 space, and another letter, the number of spaces inside the triangle should be 2 ** n  - 1 where n represents the current row or iteration (or just increment by 2)

Data Strucure
---------------
Array for letters
No data structure

Example
---------------
A

  A
 B B
C   C
 B B
  A
  
    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A

Algorithm
---------------
create a Diamond class
create a make_diamond class method that accepts one argument
take the argument (letter) and use it to create a range from a to the letter
trasnform the range of letters into an array
iterate over the array
call methods to form the top of the diamond
- get size of array (grid size) divide by half and add 1
- number of outer spaces equlas the above
- add the current letter iteration to the end
- get inner spaces by taking 2 raised to the index and subtract 1
- add letter if inner spaces is greater than zero
call methods to form the bottom of the diamond
- same method but in reverse

Code
---------------
=end

class Diamond

  def self.make_diamond(letter)
    letters = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    width = max_width(letter)
    
    letters.map do |ltr|
      make_row(ltr).center(width)
    end.join("\n") + "\n"
  end

  class << self

  def max_width(letter)
    return 1 if letter == 'A'
    ('B'..letter).reduce(1) { |sum, _| sum += 2 }
  end

  def make_row(letter)
    return 'A' if letter == 'A'
    return 'B B' if letter == 'B'

    letter + spaces(letter) + letter
  end

  def spaces(letter)
    return "" if letter == 'A'
    return " " if letter == 'B'
    number = ('C'..letter).reduce(1) { |sum, _| sum += 2 }
    " " * number
  end

  end
end

# solution
class Diamond
  def self.make_diamond(letter)
    range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    diamond_width = max_width(letter)

    range.each_with_object([]) do |let, arr|
      arr << make_row(let).center(diamond_width)
    end.join("\n") + "\n"
  end

  private

  def self.make_row(letter)
    return "A" if letter == 'A'
    return "B B" if letter == 'B'

    letter + determine_spaces(letter) + letter
  end

  def self.determine_spaces(letter)
    all_letters = ['B']
    spaces = 1

    until all_letters.include?(letter)
      current_letter = all_letters.last
      all_letters << current_letter.next
      spaces += 2
    end

    ' ' * spaces
  end

  def self.max_width(letter)
    return 1 if letter == 'A'

    determine_spaces(letter).count(' ') + 2
  end
end