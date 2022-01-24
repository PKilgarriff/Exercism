class Raindrops
	def self.convert(n)
		return_string = ""
		# do a test for each factor and save as booleans
		pling = (n % 3).zero?
		plang = (n % 5).zero?
		plong = (n % 7).zero?
		# return the digits as a string if none of the three tests return true
		return n.to_s if !(pling || plang || plong)
		# return either a string of raindrop noises or the digits (as a string?) depending on factors
		# assemble the raindrop string based on those booleans
		return_string += "Pling" if pling
		return_string += "Plang" if plang
		return_string += "Plong" if plong
		return_string
	end
end