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

	it 'Can release a bike from a person' do
		station = DockingStation.new
		bike = double :bike
		bikes = double :bikes

		expect(station.release_bike)
	end
end	