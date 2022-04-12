# frozen_string_literal: true

require 'pry'

# Handle CSV parsing
class CustomerImporter
  COMMON_SEPERATORS = ['|', ',', ';', '#', '/t'].freeze

  def self.import(file_path:)
    @file_path = file_path
    @data = []
    parse_file
  end

  def self.parse_file
    File.open(@file_path) do |file|
      CSV.foreach(file, col_sep: determine_probable_seperator(file.readline)) do |row|
        customer = Customer.new(first_name: row[0], last_name: row[1], email: row[2])
        vehicle = Vehicle.new(type: row[3], name: row[4], length: row[5])

        @data << {
          full_name: customer.full_name,
          email: customer.email,
          vehicle_type: vehicle.type,
          vehicle_name: vehicle.name,
          vehicle_length: vehicle.length
        }
      end
    end
    @data
  end

  def self.determine_probable_seperator(line)
    COMMON_SEPERATORS.group_by { |sep| line.count(sep) }.max.flatten[1]
  end

  class << self
    private :parse_file, :determine_probable_seperator
  end
end
