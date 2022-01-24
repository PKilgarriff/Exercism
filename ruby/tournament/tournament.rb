class Tournament
	#attr_reader :entry
	HEADER = "#{"Team".ljust(30)} | #{"MP".rjust(2)} | #{"W".rjust(2)} | #{"D".rjust(2)} | #{"L".rjust(2)} | #{"P".rjust(2)}\n"

	def self.tally(input)
		@table = {}
		@team_names = []	
		@output = "#{HEADER}"
		#puts input.size
		return @output unless input.size > 1
		self.update_team_names(input)
		self.initialise_table
		self.update_results
		# used the minus sign as it then sorts descending, but doesn't have the issue of .reverse that would also switch the alphabetical order
		@team_names.sort_by! { |team_name| -@table[team_name][:points] }
		#puts @table
		@team_names.each do |team_name|
			@output += self.create_string(team_name)
		end
		return @output
	end

	def self.update_team_names(input)
		@input_lines = input.split("\n")
		@input_lines.each do |line|
			first, second, _ = line.split(";")
			@team_names.push(first, second)
		end
		@team_names.sort!.uniq!
	end

	def self.initialise_table
		for i in 0...@team_names.size
			name = @team_names[i]
			@table[name] = {
				#name: @team_names[i],
				wins: 0,
				draws: 0,
				losses: 0,
				played: 0,
				points: 0
			}
		end
	end
	
	def self.update_results
		@input_lines.each do |line|
			info = line.split(";")
			#print info
			#first, second, outcome = info[0..2]
			first = info[0]
			second = info[1]
			outcome = info[2]
			#puts "#{first} #{second} #{outcome}"
			if outcome == "win"
				#puts "#{first} beat #{second}"
				# add a win to the first team
				@table[first][:wins] += 1
				# add a loss to the second team
				@table[second][:losses] += 1
			elsif outcome == "loss"
				#puts "#{first} lost to #{second}"
				# add a loss to the first team
				@table[first][:losses] += 1
				# add a win to the second team
				@table[second][:wins] += 1
			elsif outcome == "draw"
				#puts "#{first} and #{second} drew"
				# add a draw to both teams
				@table[first][:draws] += 1
				@table[second][:draws] += 1
			end
		end
		@table.each do |team, stats|
			# Games played is the sum of all the teams results
			stats[:played] = stats[:wins] + stats[:draws] + stats[:losses]
			# Points are calculated with 3 for a win, and 1 for a draw (0 for a loss)
			stats[:points] = (3 * stats[:wins]) + stats[:draws]
			#puts "#{team} have #{stats[:points]}"
		end
	end

	def self.create_string(team_name)
		wins = @table[team_name][:wins].to_s
		draws = @table[team_name][:draws].to_s
		losses = @table[team_name][:losses].to_s
		matches_played = @table[team_name][:played].to_s
		points = @table[team_name][:points].to_s

		string = "#{team_name.ljust(30)} | #{matches_played.rjust(2)} | #{wins.rjust(2)} | #{draws.rjust(2)} | #{losses.rjust(2)} | #{points.rjust(2)}\n"
		return string
	end

end