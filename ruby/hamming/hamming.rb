class Hamming
	def self.compute(strand_a, strand_b)
		raise ArgumentError if strand_a.length != strand_b.length
		
		@hamming_distance = 0
		
		for i in 0...strand_a.length
			@hamming_distance += 1 if strand_a[i] != strand_b[i]
		end
		
		return @hamming_distance
	end
end
