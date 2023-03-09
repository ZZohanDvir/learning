# frozen-string-literal: true

require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'

class Route
  attr_accessor :stations, :name

  include Accessors
  include InstanceCounter
  include Validation

  validate :name, :presence
  validate :name, :type, String
  validate :deprture_station, :type, Station
  validate :arrival_station, :type, Station

  def initialize(departure_station, arrival_station, name)
    @stations = [departure_station, arrival_station]
    @name = name
    validate_route(name, stations)
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def del_station(station)
    stations.delete(station)
  end

  def view_route
    stations.each { |station| puts station.name }
  end

  def valid?
    validate_route(number, stations)
    true
  rescue StandardError
    false
  end
end