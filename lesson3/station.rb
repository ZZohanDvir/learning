class Station
  attr_reader :trains, :station_name

  def initialize(station_name)
    @station_name = station_name
    @trains = []
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
end