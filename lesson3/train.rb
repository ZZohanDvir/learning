class Train
  attr_accessor :speed, :route
  attr_reader :number, :type, :waggonage

  def initialize(number, type, waggonage)
    @number = number
    @type = type
    @waggonage = waggonage
    @speed = 0
  end

  def stop
    self.speed = 0
  end
  
  def car_hook
    self.waggonage += 1 if self.speed == 0

  def car_unhook
    self.waggonage -= 1 if self.speed == 0 && @waggonage >= 1
  end

  def start_route(route)
    self.route = route
    self.route.stations[0].train_arrive(self)
    @current_station = 0
  end

  def current_station
    route.stations[@current_station]
  end

  def previous_station
    route.stations[@current_station - 1] if @current_station > 0
  end

  def next_station
    route.stations[@current_station + 1]
  end

  def run_forward
    return unless next_station
    current_station.train_depart(self)
    next_station.train_arrive(self)
    @current_station += 1
  end

  def run_back
    return unless previous_station
    current_station.train_depart(self)
    previous_station.train_arrive(self)
    @current_station -= 1
  end

end