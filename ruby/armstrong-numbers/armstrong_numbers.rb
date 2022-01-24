class ArmstrongNumbers
	def self.include?(number)
		number_of_digits = number.digits.size
		digits_raised = number.digits.map {|digit| digit ** number_of_digits }
		return number == digits_raised.sum
	end
end