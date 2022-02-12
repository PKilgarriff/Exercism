# Make a class called ETL
# define a method (self) transform that accepts a hash
# make a new hash to store the transformed data
# go through the values of each key in the old hash
# for each value, make a lowercase key in the new hash
# Assign the key of the old hash as the value of the new key

class ETL
  def self.transform(old)
    transformed = {}
    old.each do |score, letters|
      letters.each { |letter| transformed[letter.downcase] = score }
    end
    # return the transformed hash
    transformed
  end
end
