=begin

Problem
---------------
object input = month number, and a year
method input = day of the week and schedule (first, second, etc)
output = date or date object

problem domain = define a class Meetup with a constructor taking a month and a year, and a method day taking a weekday and the schedule. The weekday is Mon- Sun and schedule is first, second, third, fourth, fifth, last, and teenth

implicit requirements = N/A
explicit requirments = case of strings is not important

mental model = require the date class and use it to acquire the fisrt day of the month of the given year. Iterate through the days until the weekday and matches the date and it meets the schedule requirements. Keep a counter of the schedule and increment until the correct one is found.

Examples
---------------
Meetup.new(2013, 3).day('Monday', 'first')
Date.civil(2013, 3, 4)

Data Structure
---------------
None

Algorithm
---------------
Require the Date class
Create a Meetup class that accepts two arguments
Assign arguments to instance variables @year and @month
Assign a Date object to an instance variable @date as the first of the month
Create a #day method that accepts two string arguments
Assign them to @day_of_week and @schedule
Loop until day == end of the month
Check each day to determine if it matches the day of the week
Add to an array of dates
#wday returns num (0-7) sunday == 0
Convert the schedule into value and select as index from an array of dates
Firsts - Fifth should be integers (1, 5) == indexes (0, 4)
Last should be the last item in the array
Teenth should be any day between 13th and 19th
The returned item should be a Date object

Code
---------------
=end

require 'date'

class Meetup
  
  DAYS_OF_WEEK_TO_NUM = {
    sunday: 0,
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6
  }
  
  attr_reader :date, :day_of_week, :schedule
  
  def initialize(year, month)
    @date = Date.new(year, month, 1)
  end
  
  def day(day_of_week, schedule)
    @day_of_week = DAYS_OF_WEEK_TO_NUM[day_of_week.downcase.to_sym]
    @schedule = schedule.downcase
    dates = select_days_of_week
    
    case schedule
    when 'first'  then dates[0]
    when 'second' then dates[1]
    when 'third'  then dates[2]
    when 'fourth' then dates[3]
    when 'fifth'  then dates[4]
    when 'last'   then dates.last
    when 'teenth' then select_teenth_day(dates)
    end
  end
  
  def select_days_of_week
    (date...date.next_month).select do |date_obj|
      date_obj.wday == day_of_week
    end
  end
  
  def select_teenth_day(list)
    list.select { |date| (13..19).include?(date.day) }.first
  end
  
end
  
  