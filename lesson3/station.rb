class Station
  
  def initialize(st_name)
    @st_name = st_name
    @trains_list = []
  end

  def train_arrive(train)
    @trains_list << @train_name
  end

  def train_depart(train)
    @trains_list.delete(@train_name)
  end

  def show_trains
    @trains_list.each {|train| puts @train_name}
  end

  def show_trains_type(type_sort)
    @trains_list.each {|train| puts @train_name if @train_type == type_sort} 
  end
end