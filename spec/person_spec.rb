require 'person'

describe Person do
	it 'has no bike' do
		person = Person.new
		expect(person.has_bike?).to eq false
	end

	it 'Can have a bike' do
		person = Person.new(:bike)
		expect(person.has_bike?).to eq true
	end

	it 'Breaks a bike when has an accident' do
		bike = double :bike
		person = Person.new(bike)
		expect(bike).to receive(:break!)
		person.crash
	end

	it 'Can rent a bike from a station' do
		station = double :dock_station
		person = Person.new
		expect(station).to receive(:release_bike)
		person.rent_a_bike_from(station)
	end

	it 'Has a bike after renting from station' do
		person = Person.new
		station = double :dock_station, {:release_bike => :bike}

		person.rent_a_bike_from(station)
		expect(person.has_bike?).to eq true
	end

	it 'Return a bike to a station' do
		person = Person.new
		station = double :dock_station
		expect(station).to receive(:receive)
		person.return_a_bike_to(station)
	end

	it 'Has no bike after returning a bike to station' do
		station = double :dock_station
		bike = double :bike
		person = Person.new(bike)

		expect(station).to receive(:receive).with(bike).and_return(nil)
		person.return_a_bike_to(station)
		expect(person.has_bike?).to eq false
	end

end