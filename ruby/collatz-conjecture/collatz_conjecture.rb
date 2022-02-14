# Create a class called CollatzConjecture
# define a method called steps that takes an integer
  # should return the number of steps to 1
  # return 0
# define a method that carries out a single step
# Use the steps method to call that single_step method repeatedly
# Increment a step counter each time
# When the return from single_step is 1, return the step counter 

class CollatzConjecture
  def self.steps(integer)
    raise ArgumentError if integer < 1
    steps = 0
    until integer == 1
      integer = single_step(integer)
      steps += 1
    end
    return steps
  end

  def self.single_step(integer)
    if integer.even?
      return integer / 2
    else
      return 3 * integer + 1
    end
    # return 1
  end
end