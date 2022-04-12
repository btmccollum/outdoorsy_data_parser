# frozen_string_literal: true

require_relative 'outdoorsy_data_parser/version'
require_relative 'outdoorsy_data_parser/customer_importer'
require_relative 'outdoorsy_data_parser/customer'
require_relative 'outdoorsy_data_parser/vehicle'

module OutdoorsyDataParser
  class Error < StandardError; end
  require 'csv'
end
