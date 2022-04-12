# frozen_string_literal: true

require 'outdoorsy_data_parser/customer_importer'

RSpec.describe CustomerImporter do
  let(:commas_path) { './spec/fixtures/files/commas.txt' }
  let(:pipes_path) { './spec/fixtures/files/pipes.txt' }
  let(:commas_result) do
    [
      {
        full_name: 'greta thunberg',
        email: 'greta@future.com',
        vehicle_type: 'sailboat',
        vehicle_name: 'fridays for future',
        vehicle_length: '32’'
      },
      {
        full_name: 'xiuhtezcatl martinez',
        email: 'martinez@earthguardian.org',
        vehicle_type: 'campervan',
        vehicle_name: 'earth guardian',
        vehicle_length: '28 feet'
      },
      {
        full_name: 'mandip singh soin',
        email: 'mandip@ecotourism.net',
        vehicle_type: 'motorboat',
        vehicle_name: 'frozen trekker',
        vehicle_length: '32’'
      },
      {
        full_name: 'jimmy buffet',
        email: 'jb@sailor.com',
        vehicle_type: 'sailboat',
        vehicle_name: 'margaritaville',
        vehicle_length: '40 ft'
      }
    ]
  end
  let(:pipes_result) do
    [
      {
        full_name: 'ansel adams',
        email: 'a@adams.com',
        vehicle_type: 'motorboat',
        vehicle_name: 'rushing water',
        vehicle_length: '24’'
      },
      {
        full_name: 'steve irwin',
        email: 'steve@crocodiles.com',
        vehicle_type: 'rv',
        vehicle_name: 'g’day for adventure',
        vehicle_length: '32 ft'
      },
      {
        full_name: 'isatou ceesay',
        email: 'isatou@recycle.com',
        vehicle_type: 'campervan',
        vehicle_name: 'plastic to purses',
        vehicle_length: '20’'
      },
      {
        full_name: 'naomi uemura',
        email: 'n.uemura@gmail.com',
        vehicle_type: 'bicycle',
        vehicle_name: 'glacier glider',
        vehicle_length: '5 feet'
      }
    ]
  end

  it 'accepts a file with comma separated values' do
    expect(File).to receive(:open).with(commas_path)
    CustomerImporter.import(file_path: commas_path)
  end

  it 'accepts a file with pipe delimited values' do
    expect(File).to receive(:open).with(pipes_path)
    CustomerImporter.import(file_path: pipes_path)
  end

  it 'returns an array of hashes with customer data from comma separated values' do
    data = CustomerImporter.import(file_path: commas_path)
    expect(data).to eq(commas_result)
    expect(data.length).to eq(4)
  end

  it 'returns an array of hashes with customer data from pipe delimited file' do
    data = CustomerImporter.import(file_path: pipes_path)
    expect(data).to eq(pipes_result)
    expect(data.length).to eq(4)
  end
end
