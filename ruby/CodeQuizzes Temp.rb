class Insect
	def initialize(age_in_days)
		@age_in_days = age_in_days
	end

	def age_in_years_int
		return @age_in_days / 365
	end

	def age_in_years
		return @age_in_days.to_f / 365
	end
end

bug = Insect.new(475)
puts bug.age_in_years
puts bug.age_in_years_int

class Lamp
	def self.about_me
		return "We brighten up people's lives."
	end
end

puts Lamp.about_me

class WaterBottle
	def initialize(size)
		@size = size
	end

	def size()
		return @size
	end
end

contigo = WaterBottle.new("10 Litres")
puts contigo.size
puts WaterBottle.new("5 Litres").size

#class Person
#	def initialize(age)
#		@age = age
#	end
#
#	def age=(new_age)
#		@age = new_age
#	end
#
#	def age
#		return @age
#	end
#end
#
#paul = Person.new(30)
#puts paul.age
#paul.age=(31)
#puts paul.age

module HappyHappy
	def say_something()
		return("Happy happy, joy joy")
	end
end

class Person
	include HappyHappy
end

class Alien
	include HappyHappy
end

# Already made a class called person above which requires an age parameter
#puts Person.new(1).say_something
puts Person.new().say_something
puts Alien.new().say_something

module MathsHelper
	def multiply_by_two(number)
		return number * 2
	end

	def exponent(base, power)
		return base ** power
	end
end

class Homework
	include MathsHelper
end

puts Homework.new.multiply_by_two(3)

class Mammal
	def heartbeat?
		true
	end
end

class Dog < Mammal
	def initialize(name)
		@name = name
	end

	def bark
		"Ruff ruff"
	end
end


fido = Dog.new("Fido")

puts fido.bark
puts fido.heartbeat?
puts fido.methods().include?(:heartbeat?)

print "#{Array.ancestors()}\n"
print "#{Dog.ancestors()}\n"

class BaseballPlayer
	def initialize(hits, walks, at_bats)
		@hits, @walks, @at_bats = hits, walks, at_bats
	end

	def batting_average
		return @hits.to_f / @at_bats
	end

	def on_base_percentage
		return (@hits + @walks).to_f / @at_bats
	end
end

babe_ruth = BaseballPlayer.new(330, 110, 1125)
puts babe_ruth.batting_average
puts babe_ruth.on_base_percentage

class Person
	attr_reader :first_name, :last_name
	
	def initialize(first_name, last_name)
		@first_name, @last_name = first_name, last_name
	end

	def full_name
		return "#{@first_name} #{@last_name}"
	end
end

paul = Person.new("Paul", "Kilgarriff")
puts paul.full_name
puts paul.first_name
puts paul.last_name

class Calculator
	include MathsHelper
	def square_root(number)
		return exponent(number, 0.5)
	end
end

calc = Calculator.new
puts calc.square_root(64)
print calc.methods