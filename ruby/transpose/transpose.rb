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
    puts max_length = @input.max_by(&:size).length
    unless @input.all? { |row| row.size == max_length }
    end
    transposed = @input.map { |row| row.chars }.transpose
    transposed.map! { |new_row| new_row.join }
    p transposed.join("\n")
    return transposed.join("\n")
  end
end

# Handle the special cases
  # Empty input -> return empty
  # Single line -> join chars with newline
# Split input on newline characters to array of strings
# Handle strings of differing lengths
  # Check for any shorter strings
    # Pad shorter strings with spaces
  # Check all strings are the same length
    # If so, use transpose method
    # Rejoin all strings with newline characters
# If string was padded with spaces, these will need to be brought left
# Count spaces in each row
# Remove all spaces from row (trim? gsub(' ','')?)
  # then pad to the left with the total number of spaces (rjust)
