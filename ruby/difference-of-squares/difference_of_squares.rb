class Squares
	def initialize(number)
		@numbers = [*1..number]
		# print @numbers
	end

	def square_of_sum
		return (@numbers.sum) ** 2
	end

	def sum_of_squares
		return @numbers.map { |number| number ** 2 }.sum
	end

	def difference
		return square_of_sum - sum_of_squares
	end
end