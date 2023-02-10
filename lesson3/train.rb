class Train
  attr_accessor :speed
  attr_accessor :waggonage
  Type = [:coach, :waggon]

  def initialize(train_name, type, waggonage = 0)
    if Type.include?(type)
      @type = type
    else
      return 
    end
    @train_name = train_name
    @waggonage = waggonage
    @att_route = []
    @current_station = []
  end

  def set_speed(speed)
    self.speed = speed
  end

  def stop
    self.speed = 0
  end
  
  def current_speed
    self.speed
  end

  def car_count
    self.waggonage
  end
  
  def car_hook
    self.waggonage += 1 if self.speed == 0
  end

  def car_unhook
    self.waggonage += 1 if self.speed == 0
  end

  def start_route(route)
    @att_route = route.station_list
    @current_station = 0
  end

  def run_forward
    @current_station = @att_route[@current_station + 1]
  end

  def run_back
    @current_station = @att_route[@current_station - 1]
  end

  def route_info
    puts train.run_back
    puts @current_station
    puts train.run_forward
  end
end