require 'bike_container'

shared_examples_for 'a bike container' do

	let(:container) { described_class.new(capacity: 10) }

	it 'Have a empty list of bikes at the beginning' do
		expect(container.bikes).to eq []
	end

	it 'Receives a bike' do
		bike = double :bike
		container.receive(bike)
		expect(container.bikes).to eq [bike]
	end

	it 'knows the number of bikes in the container' do
		bike = double :bike
		container.receive(bike)
		expect(container.bikes.count).to eq 1
	end

	it 'Is not full when created' do
		expect(container.full?).to be false
	end

	it 'Is full after adding the capacity of bikes' do
		bike = double :bike
		(container.capacity).times { container.bikes  << bike }

		expect(container.full?).to be true
	end

	it 'Can receive a group of bikes' do
		bike = double :bike, broken?: false
		working_bikes = [bike, bike, bike]
	
		container.receive_many_bikes_from(working_bikes)
		expect(container.bikes).to eq [bike, bike, bike]
	end

		it 'can receive broken bikes from a holder' do
		bike = double :bike, broken?: true
		holder = double :container, release_broken_bikes: [bike]

		container.receive_broken_bikes_from(holder)
	end

	it 'has the bikes stored after receiving the bikes from station' do
		bike = double :bike, broken?: true
		holder = double :container, release_broken_bikes: [bike]
		
		container.receive_broken_bikes_from(holder)
		expect(container.bikes).to eq [bike]
	end

		it 'Releases all of the broken bikes' do
		broken_bike = double :bike, broken?: true
		working_bike = double :bike, broken?: false
		container.receive(broken_bike)
		container.receive(working_bike)

		expect(container.release_broken_bikes).to eq [broken_bike]
	end

	it 'Doesnt have broken bikes after releasing them' do
		broken_bike = double :bike, broken?: true
		working_bike = double :bike, broken?: false
		container.receive(broken_bike)
		container.receive(working_bike)

		container.release_broken_bikes

		expect(container.bikes).to eq [working_bike]
	end

	it 'Should raise a error trying adding a bike when full' do
		working_bike = double :bike, working?: true
		(container.capacity).times { container.bikes << working_bike}

		expect{container.receive(working_bike)}.to raise_error(RuntimeError)
	end

end