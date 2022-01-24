class SimpleCalculator
	ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
	
	class UnsupportedOperation < StandardError
	end
	
	def self.calculate(first_operand, second_operand, operation)
		#return false if the first_operand is either an Integer or a Float AND the second_operand is either an Integer or a Float
		unless (first_operand.class == Integer || first_operand.class == Float) && (second_operand.class == Integer || second_operand.class == Float)
			raise ArgumentError
		end

		begin
			case operation
			when '+'
				result = first_operand + second_operand
			when '/'
				result = first_operand / second_operand
			when '*'
				result = first_operand * second_operand
			else
				raise UnsupportedOperation
			end
			# returns an interpolated string showing the full calculation and the result
			"#{first_operand} #{operation} #{second_operand} = #{result}"
		rescue ZeroDivisionError => e
			"Division by zero is not allowed."
		end
	end
end