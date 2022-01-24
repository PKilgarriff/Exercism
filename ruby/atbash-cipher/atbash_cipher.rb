class Atbash
	ALPHABET = [*"a".."z"]
	NUMBERS = [*0..9].map { |number| number.to_s}
	ENCODER = (ALPHABET | NUMBERS).zip(ALPHABET.reverse | NUMBERS).to_h
	DECODER = (ALPHABET.reverse | NUMBERS).zip(ALPHABET | NUMBERS).to_h

	def self.encode(plaintext)
		# remove all spaces from inside and outside the string
		# map the characters to a new array, using the look-up values from the appropriate hash
		# join the characters into a string which then gets chunked into 5 character sections to be rejoined with spaces
		return (plaintext.downcase.delete(' ').chars.map { |char| ENCODER[char] }).join.scan(/.{1,5}/).join(' ')
	end

	def self.decode(ciphertext)
		return (ciphertext.downcase.delete(' ').chars.map { |char| DECODER[char] }).join
	end
end