module Validation

  Train_number_sample = /^(\d|.){3}-?(\d|.){2}$/
  
  def validate_train(number)
    raise 'Отсутствет номер поезда' if number.nil?
    raise 'Номер не соответствует шаблону' unless number.match(Train_number_sample)
  end

  def validate_route(name, stations)
    raise 'Название маршрута не может быть пустым' if name.nil?
    raise 'Границы маршрута не указаны' if stations.size < 2
  end

  def validate_station(name)
    raise 'Имя станции не указано' if name.nil?
  end

  def validate_car(number)
    raise 'Номер вагона не указан' if number.nil?
  end

end