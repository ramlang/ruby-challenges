=begin

Problem
---------------
input = object instaniated with word, method takes array of strings
output = array contains words that are anagrams

problem domain = write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word. Return empty array if no words match as an anagram to the original word. Anagram is considered a word with the same letters rearranged to spell a different word. Letters are case insensitive.

implicit requirements = N/A
explicit requirements = case does not matter, return empty array if no match

mental model = take origianl word and separate into an array of characters. Sort the array. iterate over the list of words given and examine each one. make each word into an array of characters and sort. if it matches the original word then add the word to the results array.

Examples
---------------
ant => tan
master => maters, stream
allergy => gallery, largely, regally

Data Structure
---------------
Array

Algorithm
---------------
Create Anagram class
Create intialize method that accepts a word as an argument
Assign the word to an instance variable @word
Define method #match that accepts an array of strings as a argument
Create empty results array
Make @word into an array of sorted characters
Iterate over the array of strings and determine if the strings as arrays match the sorted @words array
Add strings that match to the results array
return the results array

Code
---------------
=end

class Anagram
  attr_reader :word
  
  def initialize(word)
    @word = word.downcase
  end
  
  def match(list)
    list.select do |string|
      next if string.downcase == word
      word.chars.sort == string.downcase.chars.sort
    end
  end
end

# solution
class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(word_array)
    word_array.select do |ana|
      ana.downcase != word && anagram?(ana, word)
    end
  end

  private

  def sorted_letters(str)
    str.downcase.chars.sort.join
  end

  def anagram?(word1, word2)
    sorted_letters(word1) == sorted_letters(word2)
  end
end