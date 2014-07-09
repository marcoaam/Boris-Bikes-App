class DockingStation

	DEFAULT_CAPACITY = 10

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

	def receive(bike)
		bikes << bike
		nil
	end

	def release_bike
		bikes.delete(bikes.find {|bike| !bike.broken?})
	end

	def release_broken_bikes
		bikes.map { |bike| bikes.delete(bike) if bike.broken? }
	end

	def receive_many_bikes_from(container)
		container.each { |bike| receive(bike) }
	end

	def full?
		bikes.count == capacity
	end

end