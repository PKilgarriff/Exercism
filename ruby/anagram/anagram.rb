class Anagram
	def initialize(word)
		@word = word
	end

	def match(array)
		# This is needed to handle words in the array that are the exact same as the first word but in different cases
		array = array.select { |match_word| @word.downcase != match_word.downcase }
		# This selects those words in the array that once sorted alphabetically are the same as the first word
		array.select { |match_word| @word.downcase.chars.sort.join == match_word.downcase.chars.sort.join }
	end
end