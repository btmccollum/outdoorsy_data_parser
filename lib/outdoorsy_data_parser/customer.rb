# frozen_string_literal: true

class Customer
  attr_reader :first_name, :last_name, :email

  def initialize(first_name:, last_name:, email: nil)
    @first_name = first_name
    @last_name = last_name
    @email = email
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
