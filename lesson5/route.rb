class Route
  attr_accessor :stations, :name
  
  def initialize(departure_station, arrival_station, name)
    @stations = [departure_station, arrival_station]
    @name = name
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def  del_station(station)
    stations.delete(station)
  end

  def view_route
    stations.each { |station| puts station.name }
  end

end