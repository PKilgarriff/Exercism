# Make a class called Grains
# Square 1 will have 1 grain (2 ** 0)
# Square 2 will have 2 grains (2 ** 1)
# Square 3 will have 4 grains (2 ** 2)

class Grains
  def self.square(index)
    # Throw Error if index is less than 1 or more than 64
    raise ArgumentError if index < 1 || index > 64
    # Square will contain 2 to the power of one less than the index grains
    return 2 ** (index - 1)
  end

  def self.total
    # Create an array of numbers 1 to 64
    squares = [*1..64]
    # Replace each number with the result from the square function
    # Return the sum of those results
    return squares.map {|square_index| self.square(square_index) }.sum
    # Below line from community solution
    # but doesn't seem noticeably faster than above
    # Best way to test speed?
    # return (2 ** 64) - 1
  end
end