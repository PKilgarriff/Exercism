# Remove spaces
# Remove punctutation
# Trim string of digits down to the rightmost 10

class PhoneNumber
  def self.is_num?
		# Integer is a method to transform an input into an integer, but it will raise an error if it can't (then rescued in the below line)
		# The two ! will change the 'truthy' value of an actual integer into false, then true again
		!!Integer(@input)
	rescue ArgumentError, TypeError
		false
	end

  def self.code_valid?(type)
    if type == "area"
      code = @input[0]
    elsif type == "exchange"
      code = @input[3]
    elsif type == "country"
      code = @input[0]
      if code == '1'
        puts "#{code} is Valid #{type.capitalize} code"
        return true
      else
        puts "#{code} is Invalid #{type.capitalize} code"
        return false
      end
    end
 
    case code.to_i
    when 0...1
      puts "#{code} is Invalid #{type.capitalize} code"
      false
    when 2...9
      puts "#{code} is Valid #{type.capitalize} code"
      true
    end
  end

  def self.clean(input)
    puts input
    input.gsub!(' ', '') # Remove any spaces
    input.gsub!(/[[:punct:]]/, '') # Remove any punctuation
    @input = input
    puts @input
    # Check for any non-digit characters
    unless self.is_num?
      puts "Contains Non-digit characters"
      return nil
    end
    # Check for non-NANP country codes
    if @input.size == 11 && !self.code_valid?("country")
      puts "Non-NANP country code"
      return nil
    end
    # Check for overly long numbers or overly short numbers
    if @input.size > 11 || @input.size < 10
      puts "Input size is #{input.size}"
      return nil
    end
    @input = @input[-10..-1] # Only deal with last 10 characters from now on
    puts "Last Ten are #{@input}"
    # Check area code and exchange code
    return nil unless self.code_valid?("area") && self.code_valid?("exchange")
    return @input
  end
end 