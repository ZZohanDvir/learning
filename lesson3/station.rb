class Station
  attr_reader :trains_list, :st_name

  def initialize(st_name)
    @st_name = st_name
    @trains_list = []
  end

  def train_arrive(train)
    trains_list << train
  end

  def train_depart(train)
    trains_list.delete(train)
  end

  def show_trains_type(type_sort)
    trains_list.each { |train| train.type == type_sort }.size 
  end
end