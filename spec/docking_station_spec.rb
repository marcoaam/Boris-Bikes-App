require 'docking_station'

describe DockingStation do

	it 'has a docking station with a default capacity of ten' do
		station = DockingStation.new
		expect(station.capacity).to eq 10
	end

	it 'Can create a station with custom capacity' do
		station = DockingStation.new(:capacity => 20)
		expect(station.capacity).to eq 20
	end

	it 'Have a empty list of bikes at the beginning' do
		station = DockingStation.new
		expect(station.bikes).to eq []
	end

	it 'Can receive a bike' do
		bike = double :bike
		station = DockingStation.new
		station.receive(bike)
		expect(station.bikes).to eq [bike]
	end

	it 'Can knows the number of bikes in the container' do
		station = DockingStation.new
		bike = double :bike
		station.receive(bike)
		expect(station.bikes.count).to eq 1
	end

	it 'Can release a bike' do
		station = DockingStation.new
		bike = double :bike, broken?: false
		station.receive(bike)
		expect(station.release_bike).to eq bike
	end

	it 'Doesnt have the bike after releasing it' do
		station = DockingStation.new
		bike = double :bike, broken?: false
		station.receive(bike)
		station.release_bike
		expect(station.bikes).to eq []
	end

	it 'Have a list of the broken bikes' do
		station = DockingStation.new
		broken_bike = double :bike, broken?: true
		working_bike = double :bike, broken?: false
		station.receive(broken_bike)
		station.receive(working_bike)

		expect(station.release_broken_bikes).to eq [broken_bike]
	end

	it 'Doesnt have broken bikes after releasing them' do
		station = DockingStation.new
		broken_bike = double :bike, broken?: true
		working_bike = double :bike, broken?: false
		station.receive(broken_bike)
		station.receive(working_bike)
		station.release_broken_bikes

		expect(station.bikes).to eq [working_bike]
	end

	it 'can receive a group of working bikes' do
		station = DockingStation.new
		bike = double :bike, broken?: false
		working_bikes = [bike, bike, bike]
	
		station.receive_many_bikes_from(working_bikes)
		expect(station.bikes).to eq [bike, bike, bike]
	end

	it 'is not full when created' do
		station = DockingStation.new
		bike = double :bike

		expect(station.full?).to be false
	end

	it 'is full after having an certain amount of bikes' do
		station = DockingStation.new(capacity: 20)
		bike = double :bike
		(station.capacity).times { station.bikes  << bike }

		expect(station.full?).to be true
	end
	
end	