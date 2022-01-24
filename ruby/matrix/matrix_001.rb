class Matrix
	# decided to store the incoming string as an array of rows (themselves an array of digits)
	def initialize(string)
		@row_array = []
		# splitting the input string into an array of strings representing the rows
		array = string.split(/\n/)
		# going through each row string and making an array oof actual integers
		array.each { |row|
			# splitting on the whitespace by default
			numbers = row.split
			@row_array.push(numbers.map { |number| number.to_i })
		}
	end

	# because the @row_array is already created when initialised then can just return it here
	def rows
		@row_array
	end

	def columns
		@column_array = []
		# The Number of Columns is the size of one of the rows
		number_of_columns = @row_array[0].size
		# The number  of Rows is the number of subarrays in teh @row_array
		number_of_rows = @row_array.size
		# looping through the @row_array by column
		for i in 0...number_of_columns
			# creating a holding array for each column
			temp_array = []
			for j in 0...number_of_rows
				# pushing the values at the 'column' position into the holding array
				temp_array.push(@row_array[j][i])
		 	end
			# pushing the completed column into the main @column_array
		 	@column_array.push(temp_array)
		end
		return @column_array
	end
end