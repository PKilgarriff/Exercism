class SpaceAge
	EARTH_YEAR_SECONDS = 31557600
	attr_reader :on_earth

	def initialize(seconds)
		@on_earth = seconds.to_f / EARTH_YEAR_SECONDS
	end

	#Mercury: orbital period 0.2408467 Earth years
	def on_mercury
		@on_earth / 0.2408467
	end

	#Venus: orbital period 0.61519726 Earth years
	def on_venus
		@on_earth / 0.61519726
	end

	#Earth: orbital period 1.0 Earth years, 365.25 Earth days, or 31557600 seconds
	# no method as it is read directly
	
	#Mars: orbital period 1.8808158 Earth years
	def on_mars
		@on_earth / 1.8808158
	end

	#Jupiter: orbital period 11.862615 Earth years
	def on_jupiter
		@on_earth / 11.862615
	end

	#Saturn: orbital period 29.447498 Earth years
	def on_saturn
		@on_earth / 29.447498
	end

	#Uranus: orbital period 84.016846 Earth years
	def on_uranus
		@on_earth / 84.016846
	end

	#Neptune: orbital period 164.79132 Earth years
	def on_neptune
		@on_earth / 164.79132
	end
end