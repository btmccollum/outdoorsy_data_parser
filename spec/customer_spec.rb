# frozen_string_literal: true

require 'outdoorsy_data_parser/customer'

RSpec.describe Customer do
  it 'takes a first and last name' do
    customer = Customer.new(first_name: 'Johnny', last_name: 'Test')
    expect(customer.first_name).to eq('Johnny')
    expect(customer.last_name).to eq('Test')
  end

  describe '#full_name' do
    it 'returns the full name' do
      expect(Customer.new(first_name: 'Johnny', last_name: 'Test').full_name).to eq('Johnny Test')
    end
  end
end
