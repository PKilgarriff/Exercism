class LogLineParser
	def initialize(line)
	  @line = line
	end

	def message
		# @line.index(":") # get the location of the colon
		# @line.length #get the total length of the string
		# take the characters of the string from the next one after the colon, to the end of the string
		# then strip leading and trailing whitespace
		@line[(@line.index(":").next)...(@line.length)].strip
	end

	def log_level
		# take the characters of the string from the next one after the open square bracket
		# up to the close square bracket
		#convert everythign to lower case
		@line[(@line.index("[").next)...(@line.index("]"))].downcase
	end

	def reformat
		# Interpolate the results from the other two methods
		"#{message} (#{log_level})"
	end
end