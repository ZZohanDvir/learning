# frozen-string-literal: true

module Validation
  TRAIN_NUMBER_SAMPLE = /^(\d|.){3}-?(\d|.){2}$/.freeze

  def validate_train(number)
    raise 'Отсутствет номер поезда' if number.nil?
    raise 'Номер не соответствует шаблону' unless number.match(TRAIN_NUMBER_SAMPLE)
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
