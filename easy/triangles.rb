class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError unless valid_triangle?
  end
  
  def valid_triangle?
    sides_greater_than_zero? && two_sides_greater_than_third?
  end
    
  def sides_greater_than_zero?
    @sides.all? { |side| side > 0 }
  end
  
  def two_sides_greater_than_third?
    @sides[0] + @sides[1] > @sides[2] &&
    @sides[1] + @sides[2] > @sides[0] &&
    @sides[0] + @sides[2] > @sides[1]
  end
  
  def kind
    if @sides.uniq.size == 1
      "equilateral"
    elsif @sides.uniq.size == 2
      "isosceles"
    else
      "scalene"
    end
  end
end

# solution
class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
end