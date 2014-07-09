require 'van'

describe Van do
	it 'has a default capacity of 5 at the beginning' do
		van = Van.new
		expect(van.capacity).to eq 5
	end

	it 'can be created a custom capacity' do
		van = Van.new(capacity: 10)
		expect(van.capacity).to eq 10
	end

	it 'has a bike container empty at the beginning' do
		van = Van.new
		expect(van.bikes).to eq []
	end

	it 'can receive broken bikes from a station' do
		van = Van.new
		bike = double :bike, broken?: true
		station = double :van, release_broken_bikes: [bike]

		van.receive_broken_bikes_from(station)
	end

	it 'has the bikes stored after receiving the bikes from station' do
		van = Van.new
		bike = double :bike, broken?: true
		station = double :van, release_broken_bikes: [bike]
		
		van.receive_broken_bikes_from(station)
		expect(van.bikes).to eq [bike]
	end

	it 'can release working bikes to station' do
		van = Van.new
		bike = double :bike, broken?: false
		station = double :station
		van.bikes << bike

		expect(station).to receive(:receive_many_bikes).with([bike])

		van.release_working_bikes_to(station)
	end

	it 'Doesnt have the working bikes after releasing them' do
		van = Van.new
		bike = double :bike, broken?: false
		station = double :station
		van.bikes << bike
		allow(station).to receive(:receive_many_bikes).with([bike])

		van.release_working_bikes_to(station)

		expect(van.bikes).to eq []
	end

	it 'is not full when created' do
		van = Van.new
		bike = double :bike

		expect(van.full?).to be false
	end

	it 'is full after having an certain amount of bikes' do
		van = Van.new(capacity: 20)
		bike = double :bike
		(van.capacity).times { van.bikes  << bike }

		expect(van.full?).to be true
	end
end