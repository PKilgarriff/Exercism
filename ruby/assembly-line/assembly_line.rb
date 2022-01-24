class AssemblyLine
	def initialize(speed)
		@speed = speed
	end

	def production_rate_per_hour
		@base_rate = @speed * 221
		case @speed
		when 1..4
			@base_rate * 1.0
		when 5..8
			@base_rate * 0.9
		when 9
			@base_rate * 0.8
		when 10
			@base_rate * 0.77
		end
	end

	def working_items_per_minute
		(production_rate_per_hour / 60).floor
	end
end