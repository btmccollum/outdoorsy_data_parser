# frozen_string_literal: true

require 'pry'

class CustomerImporter
  COMMON_SEPERATORS = ['|', ',', ';', '\t', '#'].freeze
  HEADERS = %w[full_name email vehicle_name vehicle_type vehicle_length_ft].freeze

  def self.import(file_path:, sort_by: nil, sort_order: 'asc')
    return 'Sort order can only be \'asc\' or \'desc\'' unless %w[asc desc].include?(sort_order)

    return "Sort by must be one of: #{HEADERS.join(', ')}" if sort_by && !HEADERS.include?(sort_by.downcase)

    @file_path = file_path
    @data = []
    parse_file
    sort_by ? sort_data(sort_by, sort_order) : @data
  end

  def self.parse_file
    File.open(@file_path) do |file|
      CSV.foreach(file, col_sep: determine_seperator(file.readline)) do |row|
        add_customer_data_from_row(row)
      end
    end
    @data
  end

  def self.determine_seperator(line)
    COMMON_SEPERATORS.group_by { |seperator| line.count(seperator) }.max.flatten[1]
  end

  def self.add_customer_data_from_row(row)
    customer = Customer.new(first_name: row[0], last_name: row[1], email: row[2])
    vehicle = Vehicle.new(type: row[3], name: row[4], length_ft: row[5])

    @data << {
      full_name: customer.full_name,
      email: customer.email,
      vehicle_type: vehicle.type,
      vehicle_name: vehicle.name,
      vehicle_length_ft: vehicle.length_ft
    }
  end

  def self.sort_data(col, order)
    sorted_data = @data.sort_by { |hash| hash[col.to_sym] }
    order == 'asc' ? sorted_data : sorted_data.reverse
  end

  class << self
    private :parse_file, :determine_seperator, :add_customer_data_from_row, :sort_data
  end
end
