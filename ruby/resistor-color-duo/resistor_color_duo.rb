class ResistorColorDuo
	BAND_COLOURS = {
		"black" => '0',
		"brown" => '1',
		"red" => '2',
		"orange" => '3',
		"yellow" => '4',
		"green" => '5',
		"blue" => '6',
		"violet" => '7',
		"grey" => '8',
		"white" => '9'
	}

	def self.value(input)
		# 1. Select the inputs with an index of less than 2 (so the first two)
		# 2. map those inputs using the BAND_COLOURS constant hash (also using downcase to sanitise input)
		# 3. join the resulting array of strings, and then cast to an integer
		input.select.with_index {|colour, idx| idx < 2 }.map { |colour| BAND_COLOURS[colour.downcase] }.join.to_i
	end
end