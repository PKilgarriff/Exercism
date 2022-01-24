class Isogram
	def self.isogram?(input)
		@input = input
		@input
			.downcase # convert string to lowercase
			.scan(/[a-z]/) # find all single lowercase alphabetic characters in string and output to array
			.group_by(&:itself) # group each character by itself (so makes a hash of letters collecting each letter as an array of values)
			.transform_values(&:count) # turn those arrays into an integer count of values in that array (so number of that letter that appears)
			.values # get just the values (so the counts)
			.all? {|count| count == 1} # check that all the counts are equal to 1 (so only one occurence of each letter)
	end
end

# use the initialize to store as instance variable (but that's it)
# create isogram? method to do the rest - use as a self.method
# split apart the string into characters - only take alphabetic characters?
# group by character using that group_by and then transform_values approach
	# # method from other exercise to cannibalise
	# def word_count
	# 	puts @words.group_by(&:itself).transform_values(&:count)
	# end
# check all the values (not spaces, hyphens,underscores) to see if any are more than 1 (.any?)
# if none are, then it's an isogram