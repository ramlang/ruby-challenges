=begin

Problem
---------------
input = string
output = integer represents score

problem domain = write a program that given a word computes the Scrabble score for that word. AEIOULRST = 1, DG = 2, BCMP = 3, FHVWY = 4, K = 5, JX = 6, QZ = 10. The score is the sum of the tiles used in each word.

requirements = return 0 if no word, return 0 if non alphanumeric characters are included, ignore case

mental model = obtain word and return 0 if not a valid word. Iterate over word and total the characters based on the points. Return the score.

Examples
---------------
'' = 0
'\t\n' = 0
'a' = 1
'quirky' = 22

Data Structure
---------------
character array
score in hash

Algorithm
---------------
Create a Scrabble class
Creat initialize method that takes a string parameter
Have a valid word check?
- return 0 if empty
- return 0 if not a string (nil)
- return 0 if non alphanumeric character present in word
Create an instance method #score
Make word into an array of characters
Iterate over word and accumulate the number of points
Return number of points

Code
---------------
=end

class Scrabble
  attr_reader :word
  
  LETTER_POINTS = {
    1 => 'AEIOULNRST',
    2 => 'DG',
    3 => 'BCMP',
    4 => 'FHVWY',
    5 => 'K',
    8 => 'JX',
    10 => 'QZ'
  }
  
  def initialize(word)
    @word = word
  end
  
  def valid_word?
    word == word.to_s &&
    word == word.gsub(/[^A-Za-z]/, '')
  end
  
  def self.score(word)
    self.new(word).score
  end
  
  def score
    return 0 unless valid_word?
    points = 0
    word.upcase.chars.each do |chr|
      LETTER_POINTS.each do |point, letters|
        points += point if letters.include?(chr)
      end
    end
    
    points
  end
end

# solution
class Scrabble
  attr_reader :word

  POINTS = {
    'AEIOULNRST'=> 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
}
  def initialize(word)
    @word = word ? word : ''
  end

  def score
    letters = word.upcase.gsub(/[^A-Z]/, '').chars
    letters.each do |letter|
      POINTS.each do |all_letters, point|
        total += point if all_letters.include?(letter)
      end
    end
    total
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end