require_relative 'bike_container'

class Van

	include BikeContainer

	DEFAULT_CAPACITY = 5

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes ||= []
	end

	def receive_broken_bikes_from(station)
		station.release_broken_bikes.each { |bike| receive(bike) }
	end

	def release_working_bikes_to(container)
		container.receive_many_bikes(bikes.map { |bike| bikes.delete(bike) if !bike.broken? })
	end

	def request_fixed_bikes_from(garage)
		receive_many_bikes_from(garage.fixed_bikes)
	end

end