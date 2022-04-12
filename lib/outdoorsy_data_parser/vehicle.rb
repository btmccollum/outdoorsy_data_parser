# frozen_string_literal: true

class Vehicle
  attr_reader :name, :type, :length_ft

  def initialize(name: nil, type: nil, length_ft: nil)
    @name = name&.downcase
    @type = type&.downcase
    @length_ft = extract_length(length_ft)
  end

  # NOTE: assumes ft as a standard measure, look into handling other
  # measurement units if necessary
  def extract_length(len)
    return unless len

    len[/[.\d]+/].to_f
  end
end
