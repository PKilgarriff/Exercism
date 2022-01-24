class ResistorColor
	attr_reader :COLORS
	
	COLORS = [
		"black",
		"brown",
		"red",
		"orange",
		"yellow",
		"green",
		"blue",
		"violet",
		"grey",
		"white"
	]

	def self.color_code(input)
		# 1. Find the index of the input colour (lowercase to sanitise)
		# 2. Return that index as it will be the value of the resistor band
		COLORS.find_index(input.downcase)
	end
end