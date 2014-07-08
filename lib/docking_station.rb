require 'bike'
class DockingStation

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end

	def capacity
		@capacity
	end

	def bikes
		@bikes ||= []
	end

	def receive(bike)
		bikes << bike
	end

	def release_bike
		bikes.find { |bike| !bike.broken? }
	end

end