class PassengerCar < Car
  attr_reader :number, :type, :total_seating_capacity
  attr_accessor :hooked, :available_seating_capacity, :unavailable_seating_capacity
  
  def initialize(number, total_seating_capacity)
    super
    @type = :passenger
    @total_seating_capacity = total_seating_capacity
    @available_seating_capacity = total_seating_capacity
    @unavailable_seating_capacity = 0
  end

  def take_a_seat
    if unavailable_seating_capacity < total_seating_capacity
      available_seating_capacity -= 1
      unavailable_seating_capacity += 1
    else
      raise 'Все места уже заняты'
    end
  end

  
end