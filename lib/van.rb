require_relative 'bike_container'

class Van

	include BikeContainer

	DEFAULT_CAPACITY = 5

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes ||= []
	end

	def release_working_bikes_to(container)
		container.receive_many_bikes_from(bikes.map { |bike| bikes.delete(bike) if !bike.broken? })
	end

	def request_fixed_bikes_from(garage)
		receive_many_bikes_from(garage.fixed_bikes)
	end

end