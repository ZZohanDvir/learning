class Route
  attr_accessor: stations
  
  def initialize(departure_station, arrival_station)
    @stations = [departure_station, arrival_station]
  end

  def add_station
    stations.insert(-2, station)
  end

  def  del_station
    stations.delete(station)
  end

  def view_route
    stations.each { |station| puts station.name }
  end
end