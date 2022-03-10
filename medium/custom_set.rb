=begin

Problem
—-------------
problem domain = create a custom set type. Make it behave like a set of unique elements that can be manipulated in several well defined ways. Do not use the Ruby built-in Set type. Assume all elements of a set must be numbers.

mental model = Use an array to store this information or use a splat operator and make a certain amount of instnace variables based on how big the array size is? Make something similar to a linked list...

CustomSet object input = optional array argument
#empty? output = boolean
#contains? output = boolean
#subset? output = boolean
#disjoint? output = boolean
#eql? output = boolean
#add output = CusotmSet object
#intersection output = CustomSet object
#difference output = CustomSet object
#union = CustomSet object

Examples
—-------------
N/A


Data Strcuture
—-------------
Array


Algorithm
—-------------
Create a CustomSet class that takes an optional argument
Otherwise takes an empty array object


Code
—-------------
=end
require 'pry'
class CustomSet
  attr_reader :set
  
  def initialize(set= [])
    @set = set.uniq
  end
  
  def empty?
    @set.empty?
  end
  
  def contains?(element)
    @set.include?(element)
  end
  
  def subset?(other)
    @set.each do |element|
      return false unless other.contains?(element)
    end
    true
  end
  
  def disjoint?(other)
    @set.each do |element|
      return false if other.contains?(element)
    end
    true
  end
  
  def ==(other)
     @set.sort == other.set.sort
  end
  
  def eql?(other)
    self == other
  end
  
  def add(element)
    @set.push(element).uniq!
    self
  end
  
  def intersection(other)
    # return CustomSet.new if disjoint?(other)
    array = []
    @set.each do |element|
      array << element if other.contains?(element)
    end
    CustomSet.new(array)
  end
  
  def difference(other)
    array = self.set - other.set
    CustomSet.new(array)
  end
  
  def union(other)
    array = self.set + other.set
    CustomSet.new(array)
  end
end

# solution
class CustomSet
  def initialize(set = [])
    @elements = set.uniq
  end

  def empty?
    elements.empty?
  end

  def intersection(other_set)
    same_elements = elements.select { |el| other_set.contains?(el) }
    CustomSet.new(same_elements)
  end

  def union(other_set)
    union_set = CustomSet.new(elements)
    other_set.elements.each { |el| union_set.add(el) }
    union_set
  end

  def difference(other_set)
    different_elements = elements.select { |el| !other_set.contains?(el) }
    CustomSet.new(different_elements)
  end

  def disjoint?(other_set)
    elements.none? { |el| other_set.contains?(el) }
  end

  def eql?(other_set)
    return false unless elements.length == other_set.elements.length
    elements.all? { |el| other_set.contains?(el) }
  end

  def subset?(other_set)
    elements.all? { |el| other_set.contains?(el) }
  end

  def add(element)
    elements.push(element) unless contains?(element)
    self
  end

  def contains?(element)
    elements.include?(element)
  end

  def ==(other_set)
    eql?(other_set)
  end

  protected

  attr_accessor :elements
end