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
    self.route.waypoint_list[0].train_arrive(self)
    @current_station = 0
  end

  def current_station
    route.waypoint_list[@current_station]
  end

  def previous_st
    route.waggonage[@current_station - 1] if @current_station > 0
  end

  def next_st
    route.waypoint_list[@current_station + 1]
  end

  def run_forward
    return unless next_st
    current_station.train_depart(self)
    next_st.train_arrive(self)
    @current_station += 1
  end

  def run_back
    return unless previous_st
    current_station.train_depart(self)
    previous_st.train_arrive(self)
    @current_station -= 1
  end

end