class FlattenArray
  def self.flatten(input)
    # Use inbuilt flatten method to get 1D array, then select only values that aren't nil
    # return input.flatten.select { |item| item != nil }
    # Use inbuilt flatten method to get 1D array, then use compact method (removes empty values?)
    return input.flatten.compact
  end
end