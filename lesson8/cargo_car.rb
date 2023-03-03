class CargoCar < Car
  attr_reader :number, :type, :total_capacity
  attr_accessor :hooked, :available_capacity, :unavailable_capacity

  def initialize(number, total_capacity)
    super
    @type = :cargo
  end
  
  def load_car(volume)
    if volume <= @available_capacity
      @available_capacity += -volume
      @unavailable_capacity += volume
    else
      raise 'Недостаточно места'
    end
  end

end