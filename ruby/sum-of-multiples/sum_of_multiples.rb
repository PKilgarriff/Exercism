class SumOfMultiples
	def initialize(*factors)
		@factors = factors
	end

	def to(upper_limit)
		# print "#{@factors}\n"
		return 0 if @factors.empty?
		# Three dots ignores upper_limit
		natural_numbers = 1...upper_limit
		@multiples = []
		@factors.each do |factor|
			@multiples.push(natural_numbers.select { |number| number % factor == 0 })
		end
		# flatten the array of multiples, then sort them, then keep only the unique ones
		@multiples.flatten!.sort!.uniq!
		print "#{@multiples}\n"
		return @multiples.sum
	end
end