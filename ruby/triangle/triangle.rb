class Triangle
	def initialize(sides)
		@sides = sides.sort
	end

	def invalid?
		# sets local booleans to see if there is a reason this triangle would be invalid
		negative_or_zero_sides = !(@sides.all? { |side| side.positive? })
		degenerate = @sides.any? { |side| side == @sides.sum / 2 }
		max_side_longer_than_sum_of_others = @sides.max > (@sides.sum - @sides.max)
		return negative_or_zero_sides || degenerate || max_side_longer_than_sum_of_others
	end

	def equilateral?
		return false if self.invalid?
		# if they are all the same then it's equilateral
		# this makes a new array containing unique values from the sides array
		# then checks if its length is 1 (so the values were all the same)
		return @sides.uniq.length == 1
	end
	
	def isosceles?
		return false if self.invalid?
		# if two are the same then it's isosceles
		# this makes a new array containing unique values from the sides array
		# then checks if its length is 2 (so there was one repeating value => two equal sides)
		# @sides.uniq.length <= 2
		# Below line covers queries about whether an equilateral triangle is isosceles (Which for the purposes of this exercise it would be)
		@sides.uniq.length <= 2
	end

	def scalene?
		return false if self.invalid?
		# if they are all different then it's scalene
		# this makes a new array containing unique values from the sides array
		# then checks if its length is 3 (so the values were all different)
		@sides.uniq.length == 3
	end
end

# check if it's a valid triangle (by checking it's not an invalid triangle)
	# if they are all the same then it's equilateral
	# if they are all different then it's scalene
	# if two are the same then it's isoceles