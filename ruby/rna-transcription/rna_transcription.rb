class Complement
	RNA_CONVERTER = {
		'G' => 'C',
		'C' => 'G',
		'A' => 'U',
		'T' => 'A'
	}

	def self.of_dna(dna_sequence)
		dna_sequence.chars.map { |base| RNA_CONVERTER[base] }.join
	end
end