# frozen_string_literal: true

class CustomerImporter
  COMMON_DELIMITERS = ['|', ',', ';', '\t', '#'].freeze
  HEADERS = %w[full_name email vehicle_name vehicle_type vehicle_length_ft].freeze

  # TODO: account for data in addition to file path
  def self.import(file_path:, sort_by: nil, sort_order: 'asc')
    raise 'Sort order can only be \'asc\' or \'desc\'' unless %w[asc desc].include?(sort_order)

    raise "Sort by must be one of: #{HEADERS.join(', ')}" if sort_by && !HEADERS.include?(sort_by.downcase)

    @file_path = file_path
    @data = []
    parse_file
    sort_by ? sort_data(sort_by, sort_order) : @data
  end

  def self.parse_file
    File.open(@file_path) do |file|
      CSV.foreach(file, col_sep: determine_delimiter(file.readline)) do |row|
        add_customer_data_from_row(row)
      end
    end
    @data
  end

  # make a probable determination of delimiter being used by file/data
  def self.determine_delimiter(line)
    test = COMMON_DELIMITERS.group_by { |d| line.count(d) }.max.flatten

    raise 'Unable to determine delimiter.' unless test[0].positive?

    test[1]
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
    private :parse_file, :determine_delimiter, :add_customer_data_from_row, :sort_data
  end
end
