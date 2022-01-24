class BirdCount
	@last_week = [0, 2, 5, 3, 7, 8, 4]

	def self.last_week
		@last_week
	end

	def initialize(birds_per_day)
		@last_week = birds_per_day
	end

	def yesterday
		#returns the penultimate value in th array for 'yesterday'
		@last_week[-2]
	end

	def total
		#sum of the array
		@last_week.sum
	end

	def busy_days
		#counts how many values in the array are greater than or equal to 5
		@last_week.count { |birds| birds >= 5 }
	end

	def day_without_birds?
		#returns a boolean depending on if any of the values are zero
		@last_week.any? { |birds| birds.zero? }
	end
end
