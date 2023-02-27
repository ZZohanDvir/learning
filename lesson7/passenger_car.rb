class PassengerCar < Car
  attr_reader :number, :type
  attr_accessor :hooked
  
  def initialize(number)
    super
    @type = :passenger
  end
  
end