# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
#
def validate(data)

  if data.reduce(:+) == 0
    raise TriangleError.new "All values are zero"
  end

  if (data.any? { |i| i < 0 })
    raise TriangleError.new "No negatives are allowed"
  end

  if data[0] + data[1] <= data[2]
    raise TriangleError.new "two sides should always be greater than the third"
  end
end

#
def triangle(a, b, c)

  data = [a, b, c].sort;

  validate data

  # data is now sorted so equilateral is a = c
  return :equilateral if (data[0] == data[2])

  # if a = b or b = c then two sides match
  return :isosceles if (data[0] == data[1]) || (data[1] == data[2])

  # no match so scalene
  :scalene
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
