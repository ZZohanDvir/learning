class Route
  attr_accessor: waypoint_list
  
  def initialize(departure_st, arrival_st)
    @waypoint_list = [departure_st, arrival_st]
  end

  def add_station
    waypoint_list.insert(-2, station)
  end

  def  del_station
    waypoint_list.delete(station)
  end

  def view_route
    waypoint_list.each { |station| puts station.name }
  end
end