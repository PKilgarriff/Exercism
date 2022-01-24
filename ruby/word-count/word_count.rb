# replace all occurences of punctuation (apart from contraction apostrophes) with a space
# split the string on spaces - which should handle tabs newlines and multiple spaces
	# replace tab or newline characters with spaces - only needs to be done if whitespace ?
	# replace multiple spaces with a single space
# count the number of times each string appears in the array
# save that value to a hash where the key is the word and the value is an integer count
# return the hash
=begin
class Phrase
	# the @word_count hash is available to read from outside
	attr_reader :word_count
	
	def initialize(phrase)
		# make the hash that will be available to read from outside the instance later
		@word_count = Hash.new(nil)
		
		# Previous attempt - @phrase_string = phrase.gsub(/\W/, ' ') # will match any non-word character (so ALL punctuation - needs to be adjusted for contraction apostrophes)
		# Explanation of below lines:
			# gsub globally substitues anything that matches the following regex strings for a single space
			# \s\' = a literal apostrophe following a whitespace character (so at the start of a word)
			# \'\s = a literal apostrophe followed by a whitespace character (so at the end of a word)
			# the above two deal with the apostrophes that are not within words (so not contractions)
			# [^A-Za-z0-9'] = any character that DOES NOT (^) match an alphanumeric character (A-Za-z0-9) or an apostrophe (so leaving ALL REMAINING apostrophes in)
		@phrase_string = phrase.gsub(/\s\'|\'\s|[^A-Za-z0-9']/, " ") # Explanation above, then assigns value to the @phrase_array
		
		# makes everything lowercase and then splits on whitespace (including multiples or \t or \n)
		@phrase_string.downcase!
		@phrase_array = @phrase_string.split
		# go through the above array and set a key in the hash to the word, and then the value to the count of that word (or updates if it's already there)
		# this will loop through the same word several times, so could be more efficient
		@phrase_array.each { |word|
			# puts "#{word}: #{@phrase_array.count(word)}" # debug
			@word_count[word] = @phrase_array.count(word)
		}
	end
end
=end


# https://exercism.org/tracks/ruby/exercises/word-count/solutions/tenebrousedge
class Phrase
	def initialize(phrase)
		# \b are word boundaries so this gathers everything that's actually a word character or an apostrophe
	  @words = phrase.downcase.scan(/\b[\w']+\b/)
	  print @words
	end
	def word_count
	  puts @words.group_by(&:itself)
	  #.transform_values(&:count)
	end
  end
  module BookKeeping
	VERSION = 1
  end