class Clock
	# 60 minutes per hour, 24 hours per day
	MINUTES_PER_DAY = 60 * 24
	attr_reader :minutes

	def initialize(input)
		hour = input[:hour] || 0 # get the value of hour passed in, otherwise zero if it's nil
		minute = input[:minute] || 0 # get the value of minute passed in, otherwise zero if it's nil
		@minutes = ((hour * 60) + minute) % MINUTES_PER_DAY # get the remainder when full days are removed
		# Alternative method
		#@minutes = (((input[:hour] || 0) * 60) + (input[:minute] || 0)) % MINUTES_PER_DAY # get the remainder when full days are removed
		# print "#{[@minutes / 60, @minutes % 60]}\n"
		#return [@minutes / 60, @minutes % 60]
	end

	def to_s # uneasy that this has to be the same name as a built-in method
		# NOTE To above - it has to be because you need to implement a different method from the default one it would inherit from Object
		# This was basically the aim of the exercise
		@minutes = @minutes % MINUTES_PER_DAY # remove any full days that have crept in
		"%02d:%02d" % [@minutes / 60, @minutes % 60]
	end

	def +(clock_update)
		# get the minutes from the new clock instance passed in, add them to this instance's minutes
		@minutes += clock_update.minutes
		return self.to_s
	end

	def -(clock_update)
		# get the minutes from the new clock instance passed in, subtract them from this instance's minutes
		@minutes -= clock_update.minutes
		return self.to_s
	end

	def ==(other_clock)
		# compare the value of the minutes variable from each instance of the class
		# if they are equal values then the clocks themselves are equal
		self.minutes == other_clock.minutes
	end
end