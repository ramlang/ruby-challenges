=begin

Problem
---------------
problem domain = write a simple linked list implementation. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. Create a singly linked list whose elements may contain a range of data such as the numbers 1 - 10. Provide functions to reverse the linked list and convert a linked list to and from an array.

element object input = integer (second optional)
simple linked list input = none

element object output = value
simple linked list output = depends on method (default = object)

List of methods
#size
#empty?
#peek
#head
#tail?
#datum
#next
#pop
#to_a (do not mutate the list)
#reverse (do not mutate, return new list)
::from_a

Element class mental model = 
#datum
returns the element(s)

#tail?
returns the last element

#next
returns next element in list
if only one element should return nil
if two elements return last element
=end

class Element
  attr_reader :element, :next_element
  attr_accessor :current_datum
  
  def initialize(element, next_element= nil)
    @element = element
    @next_element = next_element
  end
  
  def datum
    element
  end
  
  def next
    next_element
  end
  
  def tail?
    self.next.nil? ? true : false
  end
end
  
class SimpleLinkedList
  
  def initialize
    @list = []
  end
  
  def size
    @list.size
  end
  
  def empty?
    size == 0
  end
  
  def push(item)
    @list.prepend(Element.new(item, @list[0]))
  end
  
  def peek
    empty? ? nil : head.datum
  end
  
  def head
    @list.first
  end
  
  def pop
    @list.shift.datum
  end
  
  def to_a
    @list.map { |element| element.datum }
  end
  
  def reverse
    new_list = SimpleLinkedList.new
    @list.each { |element| new_list.push(element.datum) }
    new_list
  end
  
  def self.from_a(array)
    array = [] if array.nil?
    list = SimpleLinkedList.new
    array.reverse_each { |n| list.push(n) }
    list
  end
end

# solution
class Element
  attr_reader :datum, :next
  
  def initialize(datum, next_element= nil)
    @datum = datum
    @next = next_element
  end
  
  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head
  
  def size
    size = 0
    current_elem= @head
    while (current_elem)
      size += 1
      current_elem = current_elem.next
    end
    size
  end
  
  def empty?
    @head.nil?
  end
  
  def push(datum)
    element = Element.new(datumm, @head)
    @head = element
  end
  
  def peek
    @head.datum if @head
  end
  
  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end
  
  def self.from(array)
    array = [] if array.nil?
    
    list = SimpleLinkedList.new
    array.reverse_each { |datum| list.push(datum) }
    list
  end
  
  def to_a
    array = []
    current_elem = head
    while !current_elem.nil?
      array.push(current_elem.datum)
      current_elem = current_elem.next
    end
    array
  end
  
  def reverse
    list = SimpleLinkedList.new
    current_elem = head
    while !current_elem.nil?
      list.push(current_elem.datum)
      current_elem = current_elem.next
    end
    list
  end
end