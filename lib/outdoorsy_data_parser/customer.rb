# frozen_string_literal: true

class Customer
  attr_reader :first_name, :last_name, :email

  def initialize(first_name: nil, last_name: nil, email: nil)
    @first_name = first_name&.downcase
    @last_name = last_name&.downcase
    @email = email&.downcase
  end

  def full_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    elsif first_name
      first_name
    elsif last_name
      last_name
    end
  end
end
