=begin
Write your code for the 'Secret Handshake' exercise in this file. Make the tests in
`secret_handshake_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/secret-handshake` directory.
=end


class SecretHandshake
	HANDSHAKE_CONVERSION = ['wink',
		'double blink',
		'close your eyes',
		'jump',
		'reverse sequence'
	].freeze

	def initialize(number)
		@binary_number = number.to_i
		@binary_string = @binary_number.to_s(2)
		@binary_string_reversed = @binary_string.reverse
		@secret_handshake = []
	end

	def commands
		#go through each character in the string and add the corresponding action
		#could use the length of the string to see if the 10000 is there?
		for i in 0...@binary_string_reversed.length
			if @binary_string_reversed[i] == '1'
				#print HANDSHAKE_CONVERSION[i]
				@secret_handshake.push(HANDSHAKE_CONVERSION[i])
			end
		end
		if @secret_handshake.include?('reverse sequence')
			@secret_handshake.pop
			@secret_handshake.reverse!
		end
		return @secret_handshake
	end
end