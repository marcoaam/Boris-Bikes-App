module BikeContainer

	DEFAULT_CAPACITY = 10

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def bikes
		@bikes
	end

	def receive(bike)
		raise "Bike storage full" if full?
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

	def receive_broken_bikes_from(container)
		container.release_broken_bikes.each { |bike| receive(bike) }
	end

end