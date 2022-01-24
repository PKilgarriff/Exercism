class BoutiqueInventory
	def initialize(items)
		@items = items
	end

	def item_names
		#for each hash (item) take the value from the key 'name'
		#map the names to a new array of strings, and sort
		@items.map { |item| item[:name]	}.sort
	end

	def cheap
		#select only the hashes where the value of 'price' is < 30
		@items.select { |item| item[:price] < 30 }
	end

	def out_of_stock
		#select only the hashes where the quantity_by_size object is empty
		@items.select { |item| item[:quantity_by_size].empty? }
	end

	def stock_for_item(name)
		#find the hash where the name matches the input 'name' argument
			# select useful for multiple, find used here because we are looking for one specific hash
		#return the value of the key :quantity_by_size (Which should be the hash of sizes and quantities)
		@desired_object = name
		@items.find { |item| item[:name] === @desired_object }[:quantity_by_size]
	end

	def total_stock
		# map all the items to an array of hashes
		# sum all the values of the :quantity_by_size object
		# then sum each sum of the :quantity_by_size sums to get the total sum
		@items.map { |item| item[:quantity_by_size].values.sum }.sum
	end

	private
	attr_reader :items
end