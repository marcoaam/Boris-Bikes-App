require 'garage'
require_relative 'bike_container_spec'

describe Garage do

	it_behaves_like 'a bike container'

	it 'Have a default capacity of 10 when created' do
		garage = Garage.new
		expect(garage.capacity).to eq 10
	end

	it 'Can be created with a custom capacity' do
		garage = Garage.new(capacity: 20)
		expect(garage.capacity).to eq 20
	end

	it 'Have a empty bike container at the beginning' do
		garage = Garage.new
		expect(garage.bikes).to eq []
	end

	# it 'Can release all fixed bikes' do
	# 	garage = Garage.new
	# 	bike = double :bike
	# 	garage.receive(bike)
	# 	expect(bike).to receive(:fix!)
	# 	garage.fixed_bikes
	# end

	# it 'Can release all fixed bikes' do
	# 	garage = Garage.new
	# 	bike = double :bike, broken?: true
	# 	garage.receive(bike)
	# 	allow(bike).to receive(:fix!)

	# 	expect(garage.fixed_bikes).to eq [bike]
	# end


	# it 'Can release all fixed bikes' do
	# 	garage = Garage.new
	# 	bike = double :bike, broken?: true
	# 	garage.receive(bike)
	# 	allow(bike).to receive(:fix!)
	# 	garage.fixed_bikes

	# 	expect(garage.bikes).to eq []
	# end

end