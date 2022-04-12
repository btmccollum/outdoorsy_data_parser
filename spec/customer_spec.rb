# frozen_string_literal: true

require 'outdoorsy_data_parser/customer'

RSpec.describe Customer do
  it 'takes a first and last name' do
    customer = Customer.new(first_name: 'Johnny', last_name: 'Test')
    expect(customer.first_name).to eq('johnny')
    expect(customer.last_name).to eq('test')
  end

  it 'takes an optional email' do
    expect(Customer.new(
      first_name: 'johnny',
      last_name: 'test',
      email: 'test@example.com'
    ).email).to eq('test@example.com')
    expect(Customer.new(
      first_name: 'rachel',
      last_name: 'test'
    ).email).to be_nil
  end

  it 'converts all data to lowercase for consitent formatting' do
    customer = Customer.new(first_name: 'JoHnNy', last_name: 'TEST', email: 'JTEST@gmAIL.com')
    expect(customer.first_name).to eq('johnny')
    expect(customer.last_name).to eq('test')
    expect(customer.email).to eq('jtest@gmail.com')
  end

  describe '#full_name' do
    it 'returns the full name' do
      expect(Customer.new(
        first_name: 'johnny',
        last_name: 'test'
      ).full_name).to eq('johnny test')
    end
  end
end
