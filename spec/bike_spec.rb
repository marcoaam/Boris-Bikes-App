require 'bike'

describe Bike do

	let(:bike) { Bike.new }
	
	it 'Is not broken at the beginning' do

		expect(bike.broken?).to be false
	end

	it 'Can break' do
		bike.break!

		expect(bike.broken?).to be true
	end

	it 'Can be fixed' do
		bike.fix!

		expect(bike.broken?).to be false
	end
end