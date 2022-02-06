# Create a Matrix class
# Create initialize fucntion to turn input string into matrix of integers
# Cast integers to strings
# Include way of accessing rows
# Include way of accessing columns
#### I have already completed a matrix exercise and can reuse that code ####

# Work out minimum value in each column
# Work out maximum value in each column
# See if those values match?

class Matrix
	attr_reader :rows, :columns

	def initialize(string)
		@rows = []
		# splitting the input string into an array of strings representing the rows
		array = string.split("\n")
		# going through each row string and making an array of actual integers
		array.each { |row|
			# splitting on the whitespace by default
			numbers = row.split
			@rows.push( numbers.map { |number| number.to_i } )
		}
		# Turns out there's a method for this exact situation, that works with a 2D array with equal numbers of rows and columns
		@columns = @rows.transpose
	end

  def saddle_points
  end
end