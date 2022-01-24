class TwelveDays
	@gifts_array = [" twelve Drummers Drumming,", " eleven Pipers Piping,", " ten Lords-a-Leaping,", " nine Ladies Dancing,", " eight Maids-a-Milking,", " seven Swans-a-Swimming,", " six Geese-a-Laying,", " five Gold Rings,", " four Calling Birds,", " three French Hens,", " two Turtle Doves, and", " a Partridge in a Pear Tree."]

	@ordinal_strings = {
		1 => "first",
		2 => "second",
		3 => "third",
		4 => "fourth",
		5 => "fifth",
		6 => "sixth",
		7 => "seventh",
		8 => "eighth",
		9 => "ninth",
		10 => "tenth",
		11 => "eleventh",
		12 => "twelfth"
		}

	def self.song
		#make the initial string that will eventually be returned once all the lyrics have been added
		song_lyrics = ""
		#loop thorugh the twelve days
		for day in 1..12
			#use string interpolation to add the inital part of the string with the ordinal from the dictionary
			song_lyrics += "On the #{@ordinal_strings[day]} day of Christmas my true love gave to me:"
				# use the negative of the day for the next loop so we can move through the gift array from the end
				index = -1 * day
				for gift in index..-1
					# add the string tot he lyrics
					song_lyrics += @gifts_array[gift]
				end
				# add two new line characters
				song_lyrics += day != 12 ? "\n\n" : "\n"
			end
		return song_lyrics
	end
end