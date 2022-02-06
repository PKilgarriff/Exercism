# define a class called ResistorColorTrio
# make a hash of colour bands to integers (COLOR_BANDS)
# give it an initialize method that takes an array of three strings
# save the user_input to an instance variable (bands_array)
# make a label function
# change the user_input array to the corresponding integers - save in value_array
# put the first two together
# work out how many zeros are needed based on the third one - make into separate function
  # use value of third band as exponent of 10 to get number to multiply first two by
  # e.g. if 2 then will return 10**2 which is 100 (2 zeros)
  # This also works for 0 and 1 (1 and 10 respectively)
# work out if it's higher than 1000 ohms
# return a string with the first numbers, the appropriate numebr of zeros and the apporopriate unit

class ResistorColorTrio
  COLOR_BANDS = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  def initialize(bands_array)
    raise ArgumentError if bands_array.any? { |band| COLOR_BANDS[band.downcase.to_sym].class != Integer }
    # bands_array.each { |band| puts COLOR_BANDS[band.downcase.to_sym].class }
    @bands_array = bands_array
  end

  def zeros_calculator(third_band)
    10 ** third_band
  end

  def format_units(resistor_value)
    if resistor_value > 1000
      "#{resistor_value / 1000} kiloohms"
    else
      "#{resistor_value} ohms"
    end
  end

  def label
    value_array = @bands_array.map { |band| COLOR_BANDS[band.downcase.to_sym] }
    resistor_value = "#{value_array[0]}#{value_array[1]}".to_i * zeros_calculator(value_array[2])
    "Resistor value: #{format_units(resistor_value)}"
  end
end