class Bike

	def initialize(working_state=false)
		@broken = working_state
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
	end

	def fix!
		@broken = false
	end

end