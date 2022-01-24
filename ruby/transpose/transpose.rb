class Transpose
	def self.transpose(input)
		@input = input.split("\n")
		# here is where to deal with rows with different lengths
		transposed = @input.map { |row| row.chars }.transpose
		if @input.include?("\n")
			@input = @input.split("\n")
			puts @input.class
		else
			@input = [@input]
			puts @input.class
		end
		# puts @input.size
		transposed.map! { |new_row| new_row.join }
		return transposed.join("\n")
		# @input.chars
		# puts @input.join()
	end
end

# Check for newline characters
	# if any exist then split into lines - array of strings
	# if none exist, then just split stright into characters?

#Transpose.transpose("ABC\nDEF")