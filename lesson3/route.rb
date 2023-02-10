class Route
  def initialize(departure_st, arrival_st)
    @departure_st = departure_st.name
    @arrival_st = arrival_st.name
    @waypoint_list = [@departure_st]
  end

  def add_station
    @waypoint_list << station
  end

  def  del_station
    @waypoint_list.delete(station)
  end

  def station_list
    @waypoint_list << @arrival_st
    @waypoint_list.each {|station| puts station.name}
    puts @arrival_st
  end
end