# frozen_string_literal: true

class Vehicle
  attr_reader :name, :type, :length

  def initialize(name:, type:, length:)
    @name = name&.downcase
    @type = type&.downcase
    @length = length
  end
end
