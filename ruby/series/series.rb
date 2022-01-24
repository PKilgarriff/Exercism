class Series
	# save input string as instance variable
	def initialize(string)
		@string = string
	end

	def slices(n)
		#Raises and error if the slice requested is greater than the length of the string
		raise ArgumentError if n > @string.length
		return_array = []
		for i in 0...@string.length
			# use slice to return substrings and check they aren't too short
			return_array << @string[i,n] if @string[i,n].length == n
		end
		return_array
	end
end