# three methods
# returns highest score from a list of integers (array)
# return the three highest scores from that list
# most recently added score
# maintain a list of scores in the order they are added

class HighScores
	def initialize(scores)
		@scores = scores
	end

	def scores
		@scores
	end

	def latest
		# return final value from array (so most recent)
		@scores[-1]
	end

	def personal_best
		# return the maximum value of the scores array
		@scores.max
	end

	def personal_top_three
		# create a sorted array fron the scores, and then reverse it
		sort_scores = @scores.sort.reverse
		# return the frst three of this descending array
		sort_scores[0..2]
	end

	def latest_is_personal_best?
		# compare the results of the latest and personal_best methods
		latest == personal_best
	end
end