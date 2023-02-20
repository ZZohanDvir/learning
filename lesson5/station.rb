require_relative 'instance_counter.rb'

class Station
  attr_reader :trains, :name
  include InstanceCounter
  @@instances = []
  
  def initialize(name)
    @name = name
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

end