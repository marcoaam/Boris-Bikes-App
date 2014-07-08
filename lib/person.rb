class Person

	def initialize(bike=nil)
		@bike = bike
	end

	def has_bike?
		!@bike.nil?
	end

	def crash
		@bike.break!
	end

	def rent_a_bike_from(station)
		@bike = station.release_bike
	end

	def return_a_bike_to(station)
		@bike = station.receive(@bike)
	end

end