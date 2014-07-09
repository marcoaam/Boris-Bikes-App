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
	
end	