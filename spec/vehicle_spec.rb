# frozen_string_literal: true

require 'outdoorsy_data_parser/vehicle'

RSpec.describe Vehicle do
  it 'can take a name, type, and length' do
    vehicle = Vehicle.new(name: 'Boaty', type: 'motorboat', length: "32'")
    expect(vehicle.name).to eq('boaty')
    expect(vehicle.type).to eq('motorboat')
    expect(vehicle.length).to eq("32'")
  end

  it 'converts all data to lowercase for consitent formatting' do
    vehicle = Vehicle.new(name: 'BoaTY MCboatFAce', type: 'MOTORboat', length: "32'")
    expect(vehicle.name).to eq('boaty mcboatface')
    expect(vehicle.type).to eq('motorboat')
    expect(vehicle.length).to eq("32'")
  end
end
