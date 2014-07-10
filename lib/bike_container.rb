module BikeContainer

	DEFAULT_CAPACITY = 10

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

	def full?
		bikes.count == capacity
	end

	def receive_many_bikes_from(container)
		container.each { |bike| receive(bike) }
	end

	def release_broken_bikes
		bikes.map { |bike| bikes.delete(bike) if bike.broken? }
	end

end