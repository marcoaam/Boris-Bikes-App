require_relative 'bike_container'

class Garage

	DEFAULT_CAPACITY = 10

	include BikeContainer

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes ||= []
	end

	def fixed_bikes
		bikes.each { |bike| bike.fix! }
		bikes.collect { |bike| bikes.delete(bike) }
	end

end