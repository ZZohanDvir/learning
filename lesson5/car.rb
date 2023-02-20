require_relative 'manufacturer.rb'

class Car
  
  include Manufacturer
  attr_reader :number
  attr_accessor :hooked

  def initialize(number)
    @number = number
  end

  def hook
    @hooked = true
  end

  def unhook
    @hooked = false
  end

end