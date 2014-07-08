require 'bike'

describe Bike do
	
	it 'Is not broken at the beginning' do
		bike = Bike.new

		expect(bike.broken?).to be false
	end

	it 'Can break' do
		bike = Bike.new
		bike.break!

		expect(bike.broken?).to be true
	end

	it 'Can be fixed' do
		bike = Bike.new(true)
		bike.fix!

		expect(bike.broken?).to be false
	end
end