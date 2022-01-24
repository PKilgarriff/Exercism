class Luhn
	def self.is_num?(check_string)
		# Integer is a method to transform an input into an integer, but it will raise an error if it can't (then rescued in the below line)
		# The two ! will change the 'truthy' value of an actual integer into false, then true again
		!!Integer(check_string)
	rescue ArgumentError, TypeError
		false
	end

	def self.valid?(test_string)
		
		#removes spaces
		if test_string.include?(" ") then test_string.gsub!(/\s+/, "") end
		
		#create array of characters & print
		digit_array = test_string.chars
		
		#capture "zero or one digit" array
		return false if digit_array.size <= 1
		
		# check each digit with the is_num? script. if it doesn't return true then stop the function and return false
		if !(digit_array.each.all? { |digit| is_num?(digit) })
			return false
		end

		#map the values of digit array to a test_array turning each into an actual integer and then reverse the order
		test_array = digit_array.map {|character| character.to_i}.reverse
		
		#initialise total variable
		cumulative_total = 0

		#loop through all values in the test array, sum/sum double as required
		for i in 0...test_array.size
			cumulative_total += i.odd? ? test_array[i] * 2 : test_array[i]
			if i.odd? && test_array[i] * 2 > 9 then cumulative_total -= 9 end
		end

		return (cumulative_total % 10).zero?

	end
end