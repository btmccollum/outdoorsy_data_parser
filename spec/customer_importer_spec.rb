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
        vehicle_length_ft: 32.0
      },
      {
        full_name: 'xiuhtezcatl martinez',
        email: 'martinez@earthguardian.org',
        vehicle_type: 'campervan',
        vehicle_name: 'earth guardian',
        vehicle_length_ft: 28.0
      },
      {
        full_name: 'mandip singh soin',
        email: 'mandip@ecotourism.net',
        vehicle_type: 'motorboat',
        vehicle_name: 'frozen trekker',
        vehicle_length_ft: 32.0
      },
      {
        full_name: 'jimmy buffet',
        email: 'jb@sailor.com',
        vehicle_type: 'sailboat',
        vehicle_name: 'margaritaville',
        vehicle_length_ft: 40.0
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
        vehicle_length_ft: 24.0
      },
      {
        full_name: 'steve irwin',
        email: 'steve@crocodiles.com',
        vehicle_type: 'rv',
        vehicle_name: 'g’day for adventure',
        vehicle_length_ft: 32.0
      },
      {
        full_name: 'isatou ceesay',
        email: 'isatou@recycle.com',
        vehicle_type: 'campervan',
        vehicle_name: 'plastic to purses',
        vehicle_length_ft: 20.0
      },
      {
        full_name: 'naomi uemura',
        email: 'n.uemura@gmail.com',
        vehicle_type: 'bicycle',
        vehicle_name: 'glacier glider',
        vehicle_length_ft: 5.0
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

  context 'sorting' do
    it 'does not sort data by default' do
      data = CustomerImporter.import(file_path: commas_path)
      expect(data.first[:vehicle_name]).to eq(commas_result.first[:vehicle_name])
      expect(data.last[:vehicle_name]).to eq(commas_result.last[:vehicle_name])
    end

    it 'can optionally sort by valid headers, asc default' do
      data = CustomerImporter.import(file_path: commas_path, sort_by: 'vehicle_type')
      expect(data.first[:vehicle_type]).to eq('campervan')
      expect(data.last[:vehicle_type]).to eq('sailboat')
      data2 = CustomerImporter.import(file_path: commas_path, sort_by: 'vehicle_length_ft')
      expect(data2.first[:vehicle_length_ft]).to eq(28)
      expect(data2.last[:vehicle_length_ft]).to eq(40)
    end

    it 'can optionally sort by valid headers, desc' do
      data = CustomerImporter.import(file_path: commas_path, sort_by: 'vehicle_type', sort_order: 'desc')
      expect(data.first[:vehicle_type]).to eq('sailboat')
      expect(data.last[:vehicle_type]).to eq('campervan')
      data2 = CustomerImporter.import(file_path: commas_path, sort_by: 'vehicle_length_ft', sort_order: 'desc')
      expect(data2.first[:vehicle_length_ft]).to eq(40)
      expect(data2.last[:vehicle_length_ft]).to eq(28)
    end

    CustomerImporter::HEADERS.each do |header|
      it "can optionally sort by #{header}" do
        data = CustomerImporter.import(file_path: commas_path, sort_by: header)
        sorted_result = commas_result.sort_by { |hash| hash[header.to_sym] }
        expect(data.first[header.to_sym]).to eq(sorted_result.first[header.to_sym])
        expect(data.last[header.to_sym]).to eq(sorted_result.last[header.to_sym])
      end
    end
  end
end
