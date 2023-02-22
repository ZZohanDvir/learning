require_relative 'manufacturer.rb'
require_relative 'validation.rb'

class Car
  
  include Manufacturer
  include Validation
  attr_reader :number
  attr_accessor :hooked

  def initialize(number)
    @number = number
    valid?
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