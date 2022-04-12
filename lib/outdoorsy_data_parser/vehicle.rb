# frozen_string_literal: true

class Vehicle
  attr_reader :name, :type, :length

  def initialize(name:, type:, length:)
    @name = name
    @type = type
    @length = length
  end
end
