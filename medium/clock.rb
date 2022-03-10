=begin

Problem
---------------
input = integer representing hour, minute
output = string representing 00:00 when to_s is called

problem domain = create a clock independent of date. Add and subtract minutes from the time represented by the clock object. Two clock objects that represent the same time should be equal to eachother.

implicit requirements = define a + method, - method, == method, to_s method, need to be able to wrap around, 24 hour clock, format with zero infront of single digits in hour and minute
explicit requriements = define an at method, addition is in minutes

mental model = have separate variables for the hour and the minute. If minutes go over 59 then increment the hour, if hour goes over 23 reset to 00, wrap around after those markers using modulus and division, create a to_s method to format the time.

Examples
---------------
clock = Clock.at(10) + 61
'11:01' == clock.to_s

Data Structure
---------------
Array

Algorithm
---------------
Create a Clock class that accepts one or two integers as arguments
Possibly initialize a Clock object since others are instance methods
Create an ::at class method
Create a +, -, == instance method
  + method
  accepts one argument
  argument represents number of minutes
  use divmod to get quotient and remainder
  add quotient to curren hour
  set minutes to remainder
  
  - method
  accept one argument
  argument represents number of minutes
  use divmod to get quotient and remainder
  subrtact quotient from current hour
  set minutes to remainder
  
  == method
  comapre #to_s to see if they are the same time

Code
---------------
=end

class Clock
  
  def self.at(hh, mm= 0)
    Clock.new(hh, mm)
  end
  
  attr_accessor :time
  
  def initialize(hour, min)
    @time = [hour, min]
  end
  
  def +(minutes)
    adjust_hour, adjust_min = minutes.divmod(60)
    
    self.time[0] = (time[0] + adjust_hour) % 24
    self.time[1] = (time[1] + adjust_min) % 60
    Clock.at(time[0], time[1])
  end
  
  def -(minutes)
    adjust_hour, adjust_min = minutes.divmod(60)
    
    if (time[1] - adjust_min) <= 0
      self.time[0] = (time[0] - adjust_hour - 1) % 24
    else
      self.time[0] = (time[0] - adjust_hour) % 24
    end
    
    self.time[1] = (time[1] - adjust_min) % 60
    Clock.at(time[0], time[1])
  end
  
  def ==(other_clock)
    to_s == other_clock.to_s
  end
  
  def to_s
    sprintf("%02d:%02d", time[0], time[1])
  end
end

# solution
class Clock
  attr_reader :hour, :minute

  ONE_DAY = 24 * 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(add_minutes)
    minutes_since_midnight = compute_minutes_since_midnight + add_minutes
    while minutes_since_midnight >= ONE_DAY
      minutes_since_midnight -= ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def -(sub_minutes)
    minutes_since_midnight = compute_minutes_since_midnight - sub_minutes
    while minutes_since_midnight < 0
      minutes_since_midnight += ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def ==(other_time)
    hour == other_time.hour && minute == other_time.minute
  end

  def to_s
    format('%02d:%02d', hour, minute);
  end

  private

  def compute_minutes_since_midnight
    total_minutes = 60 * hour + minute
    total_minutes % ONE_DAY
  end

  def compute_time_from(minutes_since_midnight)
    hours, minutes = minutes_since_midnight.divmod(60)
    hours %= 24
    new(hours, minutes)
  end
end