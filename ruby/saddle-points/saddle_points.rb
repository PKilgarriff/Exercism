# Create a Matrix class
# Create initialize fucntion to turn input string into matrix of integers
# Cast integers to strings
# Include way of accessing rows
# Include way of accessing columns
#### I have already completed a matrix exercise and can reuse that code ####

# Work out minimum value in each column
# Work out maximum value in each row
# See if those values match?
# Return an array of [row, column] for each saddle point

class Matrix
	attr_reader :rows, :columns

	def initialize(string)
		@rows = []
		# splitting the input string into an array of strings representing the rows
		array = string.split("\n")
		# going through each row string and making an array of actual integers
		array.each do |row|
			# splitting on the whitespace by default
			numbers = row.split
			@rows.push( numbers.map { |number| number.to_i } )
    end
		# Turns out there's a method for this exact situation, that works with a 2D array with equal numbers of rows and columns
		@columns = @rows.transpose
	end

  def display_matrix
    @rows.each { |row| p row }
  end

  def saddle_points
    column_mins = @columns.map { |column| column.min }
    row_maxs = @rows.map { |row| row.max }
    column_min_locations = []
    row_max_locations = []
    @columns.each_with_index do |column, column_idx|
      # p column
      # puts column_mins[column_idx]
      column_min_locations.push( column.map.with_index { |value, row_idx| value == column_mins[column_idx] ? [row_idx, column_idx] : nil }.compact)
    end
    @rows.each_with_index do |row, row_idx|
      # p row
      # puts row_maxs[row_idx]
      row_max_locations.push( row.map.with_index { |value, column_idx| value == row_maxs[row_idx] ? [row_idx, column_idx] : nil }.compact)
    end
    column_min_locations.flatten!(1)
    row_max_locations.flatten!(1)
    column_min_locations.intersection(row_max_locations)
  end
end

# Possible alternative approach
  # collect the 'location' of all the column mins
  # collect the 'location' of all the row maxes
  # do a boolean intersection on those two sets of arrays to keep only those that appear in both