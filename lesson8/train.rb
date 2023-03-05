# frozen-string-literal: true

require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'validation'

class Train
  include InstanceCounter
  include Manufacturer
  include Validation
  attr_accessor :speed, :route, :waggonage
  attr_reader :number, :type

  @@trains = []

  def initialize(number)
    @number = number
    @waggonage = []
    @speed = 0
    validate_train(number)
    @@trains << self
    register_instance
  end

  def stop
    self.speed = 0
  end

  def car_hook(car)
    @waggonage << car if speed.zero? && car.hooked == false && type == car.type
    car.hook
  end

  def car_unhook(car)
    @waggonage.delete(car) if speed.zero? && @waggonage.size.positive?
    car.unhook
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
    route.stations[@current_station - 1] if @current_station.positive?
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

  def self.find(train_number)
    @@trains.find { |train| train.number == train_number }
  end

  def valid?
    validate_train(number)
    true
  rescue StandardError
    false
  end

  def each_car(&block)
    @waggonage.each(&block)
  end
end
