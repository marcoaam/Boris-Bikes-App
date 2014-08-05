require 'van'
require_relative 'bike_container_spec'

describe Van do

	it_behaves_like 'a bike container'

	it 'has a default capacity of 5 at the beginning' do
		van = Van.new
		expect(van.capacity).to eq 5
	end

	it 'can be created a custom capacity' do
		van = Van.new(capacity: 10)
		expect(van.capacity).to eq 10
	end

	it 'can release working bikes to station' do
		van = Van.new
		bike = double :bike, broken?: false
		station = double :station
		van.bikes << bike

		expect(station).to receive(:receive_many_bikes_from).with([bike])

		van.release_working_bikes_to(station)
	end

	it 'Doesnt have the working bikes after releasing them' do
		van = Van.new
		bike = double :bike, broken?: false
		station = double :station
		van.bikes << bike
		allow(station).to receive(:receive_many_bikes_from).with([bike])

		van.release_working_bikes_to(station)

		expect(van.bikes).to eq []
	end

	it 'Can request fixed bikes from the garage' do
		van = Van.new
		bike = double :bike, broken?: false
		garage = double :garage, fixed_bikes: [bike]

		expect(garage).to receive(:fixed_bikes).and_return [bike]
		van.request_fixed_bikes_from(garage)
	end

	it 'Have the fixed bikes inside the container after requesting them' do
		van = Van.new
		bike = double :bike, broken?: false
		garage = double :garage, fixed_bikes: [bike]

		van.request_fixed_bikes_from(garage)
		expect(van.bikes).to eq [bike]
	end

end