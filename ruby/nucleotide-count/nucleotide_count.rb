# Create a class called Nucleotide
# define a method from_dna that takes a string
# define a method count that takes a single character

class Nucleotide
  def self.from_dna(string)
    @dna = string.chars
  end

  def count(character)
    @dna.select { |base| base == character}.count
  end
end