class Pangram
	def self.pangram?(sentence)
		alphabet = [*"a".."z"]
		(alphabet - sentence.downcase.chars).empty?
	end
end