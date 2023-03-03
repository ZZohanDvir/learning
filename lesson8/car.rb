require_relative 'manufacturer.rb'
require_relative 'validation.rb'

class Car
  
  include Manufacturer
  include Validation
  attr_reader :number, :total_capacity
  attr_accessor :hooked, :available_capacity, :unavailable_capacity

  def initialize(number, total_capacity)
    @number = number
    validate_car(number)
    @total_capacity = total_capacity
    @available_capacity = total_capacity
    @unavailable_capacity = 0
    @hooked = false
  end

  def hook
    @hooked = true
  end

  def unhook
    @hooked = false
  end

  def valid?
    validate_car(self.number)
    true
  rescue
    false
  end

end