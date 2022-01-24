class Matrix
	# Version 2 incorporating the 'transpose' method and also using attribute readers instead of methods
	attr_reader :rows, :columns

	def initialize(string)
		@rows = []
		# splitting the input string into an array of strings representing the rows
		array = string.split(/\n/)
		# going through each row string and making an array oof actual integers
		array.each { |row|
			# splitting on the whitespace by default
			numbers = row.split
			@rows.push(numbers.map { |number| number.to_i })
		}
		# Turns out there's a method for this exact situation, that works with a 2D array with equal numbers of rows and columns
		@columns = @rows.transpose
	end
end