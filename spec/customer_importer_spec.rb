# frozen_string_literal: true

require 'outdoorsy_data_parser/customer_importer'

RSpec.describe CustomerImporter do
  let(:commas_path) { './spec/fixtures/files/commas.txt' }
  let(:pipes_path) { './spec/fixtures/files/pipes.txt' }
  let(:result) do
    [
      {
        full_name: 'Greta Thunberg',
        email: 'greta@future.com',
        vehicle_type: 'sailboat',
        vehicle_name: 'Fridays For Future',
        vehicle_length: '32’'
      },
      {
        full_name: 'Xiuhtezcatl Martinez',
        email: 'martinez@earthguardian.org',
        vehicle_type: 'campervan',
        vehicle_name: 'Earth Guardian',
        vehicle_length: '28 feet'
      },
      {
        full_name: 'Mandip Singh Soin',
        email: 'mandip@ecotourism.net',
        vehicle_type: 'motorboat',
        vehicle_name: 'Frozen Trekker',
        vehicle_length: '32’'
      },
      {
        full_name: 'Jimmy Buffet',
        email: 'jb@sailor.com',
        vehicle_type: 'sailboat',
        vehicle_name: 'Margaritaville',
        vehicle_length: '40 ft'
      }
    ]
  end

  it 'accepts a file with comma separated values' do
    expect(File).to receive(:open).with(commas_path)
    CustomerImporter.import(file_path: commas_path)
  end

  it 'returns an array of hashes with customer data from csv' do
    expect(CustomerImporter.import(file_path: './spec/fixtures/files/commas.txt')).to eq(result)
  end
end
