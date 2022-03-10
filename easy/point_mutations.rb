=begin

Problem
--------------
input = strings that represent dna
output = integer that represents the number of point mutations

problem domain = write a program that can calculate the Hamming distance between two DNA strands. Count the number of differences between two homologous dna strands. Hamming distance is only defined for sequences of equal length. If two sequences are of unequal length compute Hamming distance over the shorter length.

implicit requirments = N/A
explicit requirements = create DNA class, create hamming_distance_method, no argument error, return empty string if empty string given, do not shorten original strand (no mutating input)

mental model = take both strings and determine which has the smaller length. Iterate over the smaller string and compare to longer string. Change string into an array to iterate over. Keep a counter to determine when there is a mutation. Increment counter. After iterating return the counter value.

Examples
--------------
assert_equal 0, DNA.new('').hamming_distance('')
assert_equal 0, DNA.new('GGACTGA').hamming_distance('GGACTGA')
assert_equal 1, DNA.new('GGACG').hamming_distance

dna = DNA.new('AGACAACAGCCAGCCGCCGGATT')
assert_equal 1, dna.hamming_distance('AGGCAA')
assert_equal 4, dna.hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')
assert_equal 1, dna.hamming_distance('AGG')

Data Structure
---------------
String > #to_a or #chars > Array

Algorithm
---------------
Define DNA class and initialize method
Accept a string parameter and assign to instance variable @strand1
Create an instance method called #hamming_distance that accepts a string argument and assign to instance variable @strand2
Create a local variable counter and assign to 0
Determine which is shorter in length and iterate over shortest strand.
sort strings by size by placing them into an array.

Compare the strand against the other strand at the current index.
If the letters are the same move on.
If the letters are different then increment the counter before moving on.
After iteration is finished return the counter value

Code
---------------
=end


# REFACTOR
class DNA
  attr_reader :strand
  
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(other_strand)
    strands = [strand, other_strand].sort_by! { |string| string.length }
    counter = 0
    
    strands[0].chars.each_with_index do |nucleotide, index|
      counter += 1 if nucleotide != strands[1].chars[index]
    end
    
    counter
  end
end

# solution
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comparison)
    shorter = @strand.length < comparison.length ? @strand : comparison
    differences = 0

    shorter.length.times do |index|
      differences += 1 unless @strand[index] == comparison[index]
    end

    differences
  end
end