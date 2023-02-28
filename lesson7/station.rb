require_relative 'instance_counter.rb'
require_relative 'validation.rb'

class Station
  attr_reader :trains, :name
  include InstanceCounter
  include Validation
  @@instances = []
  
  def initialize(name)
    @name = name
    validate_station(name)
    @trains = []
    @@instances << self
    register_instance
  end

  def all
    @@instances
  end

  def train_arrive(train)
    trains << train
  end

  def train_depart(train)
    trains.delete(train)
  end

  def show_trains_type(type_sort)
    trains.each { |train| train.type == type_sort }.size 
  end

  def self.all
    @@instances
  end

  def valid?
    validate_station(self.name)
    true
  rescue
    false
  end

end