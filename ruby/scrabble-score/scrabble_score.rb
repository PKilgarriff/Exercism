class Scrabble
	@@scores_hash_individual = {
		"A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,
		"D" => 2, "G" => 2,
		"B" => 3, "C" => 3, "M" => 3, "P" => 3,
		"F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4,
		"K" => 5,
		"J" => 8, "X" => 8,
		"Q" => 10, "Z" => 10
	}
	
	def initialize(word="")
		word = "" if word == nil
		@word = word.strip.upcase
		@letters = @word.chars
	end

	def score
		#puts "Word #{@word}"
		#print "Letters #{@letters}\n"
		running_score = 0
		@letters.each do |letter|
			#puts "Letter #{letter}"
			#puts "Score of Letter #{@@scores_hash_individual.fetch(letter)}"
			#puts "Score of Letter #{@@scores_hash_individual[letter]}"
			running_score += @@scores_hash_individual[letter]
		end
		return running_score
	end

	def self.score(input)
		return Scrabble.new(input).score
	end
end

# standardise the input
# look up the value of each letter from a hash (better data method?)
# iterate over the characters in the word and add to a running score