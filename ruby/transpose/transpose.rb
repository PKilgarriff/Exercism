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
    if @input.include?("\n")
      @input = @input.split("\n")
      puts @input.class
    else
      @input = [@input]
      # puts @input.class
    end
    # puts @input.size
    transposed.map! { |new_row| new_row.join }
    p transposed.join("\n")
    return transposed.join("\n")
    # @input.chars
    # puts @input.join()
  end
end

# Check for newline characters
  # if any exist then split into lines - array of strings
  # if none exist, then just split stright into characters?

#Transpose.transpose("ABC\nDEF")