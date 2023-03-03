require_relative 'instance_counter.rb'
require_relative 'validation.rb'

class Route
  attr_accessor :stations, :name
  include InstanceCounter
  include Validation

  def initialize(departure_station, arrival_station, name)
    @stations = [departure_station, arrival_station]
    @name = name
    validate_route(name, stations)
    register_instance
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

  def valid?
    validate_route(self.number, self.stations)
    true
  rescue
    false
  end

end