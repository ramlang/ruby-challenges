=begin

Problem
---------------
input = no input
output = Robot object with a randomly generated name

problem domain = write a program that manages robot factory settings. The name should reset if the robot is reset. The names should be random and not follow a predictable sequence. Do not allow for the same named twice when avoidable

implicit requirements = N/A
explicit requirements = robot cannot have the same name twice, the name should be name up to two letters and three intgers

mental model = create a robot class and generate a random name. Generate a random name by taking an array of alphanumeric characters and sampling 5 times to create a new name. If a previous name was generated using the name same reset again until it is not matching.

Examples
---------------
RX837
BC811

Data Structure
---------------
Hash for numbers and alphabet

Algorithm
---------------
Create a Robot class that accepts no parameters
Set a name instance variable that generates a random name
Create a name instance method
Create a reset instance variable that resets the name
Name generator method
  iterate over the alphabet selecting two random characters add to string
  iterate over digits and add three random to string
  set name instance variable equal to name as long as it doesn't already equal itself.

Code
---------------
=end

class Robot
  
  CHARS = {
    letters: ('A'..'Z').to_a,
    digits: ('0'..'9').to_a
  }
  
  attr_accessor :name
  
  @@name_history = []
  
  def initialize
    @name = set_name
  end

  def reset
    self.name = set_name
  end
  
  private
  
  def set_name
    new_name = ''
    loop do
      2.times { |_| new_name << CHARS[:letters].sample }
      3.times { |_| new_name << CHARS[:digits].sample }
      break unless @@name_history.include?(new_name)
      new_name = ''
    end
    
    @@name_history << new_name
    new_name
  end
end

# solution
class Robot
  @@names = []

  def name
    return @name if @name
    @name = generate_name while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    name = ''
    2.times { name << rand(65..90).chr }
    3.times { name << rand(0..9).to_s }
    name
  end
end