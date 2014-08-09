require 'garage'
require_relative 'bike_container_spec'

describe Garage do

	let(:garage)      { Garage.new                  }
	let(:bike) { double :bike, broken?: true }

	it_behaves_like 'a bike container'

	it 'Have a default capacity of 10 when created' do
		expect(garage.capacity).to eq 10
	end

	it 'Can be created with a custom capacity' do
		garage = Garage.new(capacity: 20)
		expect(garage.capacity).to eq 20
	end

	it 'Have a empty bike container at the beginning' do
		expect(garage.bikes).to eq []
	end

	it 'Can release all fixed bikes' do
		bike = double :bike
		garage.receive(bike)
		expect(bike).to receive(:fix!)
		garage.fixed_bikes
	end

	it 'Can release all fixed bikes' do
		allow(bike).to receive(:fix!)
		garage.receive(bike)

		expect(garage.fixed_bikes).to eq [bike]
	end

	it 'Can release all fixed bikes' do
		garage.receive(bike)
		allow(bike).to receive(:fix!)
		garage.fixed_bikes

		expect(garage.bikes).to eq []
	end

end