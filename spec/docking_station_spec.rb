require 'docking_station'
require_relative 'bike_container_spec'

describe DockingStation do

	it_behaves_like 'a bike container'

	it 'has a docking station with a default capacity of ten' do
		station = DockingStation.new
		expect(station.capacity).to eq 10
	end

	it 'Can create a station with custom capacity' do
		station = DockingStation.new(:capacity => 20)
		expect(station.capacity).to eq 20
	end

	it 'Can release the first working bike it has' do
		station = DockingStation.new
		bike = double :bike, broken?: false
		station.receive(bike)
		expect(station.release_bike).to eq bike
	end

	it 'Doesnt have the working bike after releasing it' do
		station = DockingStation.new
		bike = double :bike, broken?: false
		station.receive(bike)
		station.release_bike
		expect(station.bikes).to eq []
	end
	
end	