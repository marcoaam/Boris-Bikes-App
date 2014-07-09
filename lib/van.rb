class Van

	DEFAULT_CAPACITY = 5

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def bikes
		@bikes
	end

	def receive_broken_bikes_from(station)
		station.release_broken_bikes.each { |bike| bikes << bike }
	end

	def release_working_bikes_to(station)
		station.receive_many_bikes(bikes.map { |bike| bikes.delete(bike) if !bike.broken? })
	end

	def full?
		bikes.count == capacity
	end

end