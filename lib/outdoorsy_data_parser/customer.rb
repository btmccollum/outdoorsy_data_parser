# frozen_string_literal: true

class Customer
  attr_reader :first_name, :last_name, :email

  def initialize(first_name:, last_name:, email: nil)
    @first_name = first_name&.downcase
    @last_name = last_name&.downcase
    @email = email&.downcase
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
