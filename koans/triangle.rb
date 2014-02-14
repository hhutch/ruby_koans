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

require 'set'
def triangle(a, b, c)
  group = [a,b,c]
  count = group.map {|x| x.abs}.to_set.length
  # count = [a-c, a-b, b-c].map {|x| x.abs}.to_set # if we were testing given points and calculating the length
  raise TriangleError, "Sides have to be greater than zero" if group.to_set === [0].to_set
  raise TriangleError, "Sides have to be a positive number" if group.any? {|x| x<0}
  raise TriangleError, "Two sides can never be less than the sum of one side" if ((a+b)<c || (a+c)<b || (c+b)<a)
  raise TriangleError, "Two sides can never be  equal one side" if ((a+b)==c || (a+c)==b || (c+b)==a)
  return :equilateral if count == 1
  return :isosceles if count == 2
  return :scalene
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
