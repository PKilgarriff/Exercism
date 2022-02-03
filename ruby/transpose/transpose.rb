class Transpose
  def self.transpose(input)
    # Handle empty input
    return "" if input == ""
    # Handle single row input
    unless input.include?("\n")
      return input.chars.join("\n")
    end
    # Split input to array of rows
    @input = input.split("\n")
    # Here is where to deal with rows with different lengths
    max_length = @input.max_by(&:size).size
    puts "Max Length #{max_length}"
    strings_padded = false
    unless @input.all? { |row| row.size == max_length }
      @input.map! { |row| row.ljust(max_length) }
      strings_padded = true
    end
    transposed = @input.map { |row| row.chars }.transpose
    transposed.map! { |new_row| new_row.join }
    # p transposed.join("\n")
    return transposed.join("\n")
  end
end

# Handle the special cases
  # Empty input -> return empty
  # Single line -> join chars with newline
# Split input on newline characters to array of strings
# Handle strings of differing lengths
  # Check for any shorter strings
    # Only need to pad strings if there is a longer string to the right
    # Pad shorter strings with spaces (or a different character? finally use §)
  # Check all strings are the same length -> shouldn't need rechecking
    # If so, use transpose method
    # Rejoin all strings with newline characters
# If string was padded with spaces, these will need to be brought left
# Now that § is being used, delete all § after characters
# Replace all § before characters (remaining ones) with spaces

# No longer needed
  # Count spaces in each row
  # Remove all spaces from row (trim? gsub(' ','')?)
    # then pad to the left with the total number of spaces (rjust)
