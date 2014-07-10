require_relative 'bike_container'

class Garage

	DEFAULT_CAPACITY = 10

	include BikeContainer

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes ||= []
	end

	# def fixed_bikes
	# 	bikes.map { |bike| bike.fix! }
	# end

end