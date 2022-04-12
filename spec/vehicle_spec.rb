# frozen_string_literal: true

require 'outdoorsy_data_parser/vehicle'
require 'pry'

RSpec.describe Vehicle do
  it 'can take a name, type, and length' do
    vehicle = Vehicle.new(name: 'Boaty', type: 'motorboat', length_ft: '32 Feet')
    expect(vehicle.name).to eq('boaty')
    expect(vehicle.type).to eq('motorboat')
    expect(vehicle.length_ft).to eq(32.0)
  end

  it 'converts all data to lowercase for consitent formatting' do
    vehicle = Vehicle.new(name: 'BoaTY MCboatFAce', type: 'YACHT', length_ft: '32ft')
    expect(vehicle.name).to eq('boaty mcboatface')
    expect(vehicle.type).to eq('yacht')
    expect(vehicle.length_ft).to eq(32.0)
  end

  describe '#standardize_length_format' do
    it 'standardizes length display in feet' do
      expect(Vehicle.new(name: 'a', type: 'b', length_ft: '5 feet long').length_ft).to eq(5.0)
    end
  end
end
