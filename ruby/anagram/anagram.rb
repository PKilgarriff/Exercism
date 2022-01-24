class Anagram
	def initialize(word)
		@word = word
	end

	def match(array)
		array.select { |match_word| }
		array.select { |match_word| @word.downcase.chars.sort.join == match_word.downcase.chars.sort.join }
	end
end