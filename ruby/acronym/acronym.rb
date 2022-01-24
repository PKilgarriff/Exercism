class Acronym
	def self.abbreviate(phrase)
		# split the phrase on any non-word character using the regex ([^\w])
		# select from that array any words that are not empty
		# map (transform) those selected words to their first character in upper case
		# join the array of capital letters
		phrase.split(/[^\w]/).select { |word| !word.empty? }.map { |word| word[0].upcase }.join
	end
end