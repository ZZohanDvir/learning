class PassengerCar < Car
  attr_reader :number, :type, :total_capacity
  attr_accessor :hooked, :available_capacity, :unavailable_capacity
  
  def initialize(number, total_capacity)
    super
    @type = :passenger
  end

  def take_a_seat
    if @unavailable_capacity < @total_capacity
      @available_capacity -= 1
      @unavailable_capacity += 1
    else
      raise 'Все места уже заняты'
    end
  end

  
end