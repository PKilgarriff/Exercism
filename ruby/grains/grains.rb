# Make a class called Grains
# Square 1 will have 1 grain (2 ** 0)
# Square 2 will have 2 grains (2 ** 1)
# Square 3 will have 4 grains (2 ** 2)

class Grains
  def self.square(index)
    # Throw Error if input that already contains '§' character
    raise ArgumentError if index < 1 || index > 64
    # Square will contain 2 to the power of one less than the index grains
    return 2 ** (index - 1)
  end

  def self.total
    squares = [*1..64]
    return squares.map {|square_index| self.square(square_index) }.sum
  end
end