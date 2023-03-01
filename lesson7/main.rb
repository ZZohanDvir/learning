require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'car.rb'
require_relative 'cargo_car.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_car.rb'
require_relative 'passenger_train.rb'

class Railway 
  
  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def start
    loop do 
      show_menu
      choice = user_choice
      action(choice)
      puts
    end
  end

  #Следующие метеоды ограничены от пользователя
  private

  attr_reader :routes

  def show_menu
    menu = ['1 - Создать станцию', '2 - Создать поезд', 
    '3 - Создать маршрут, добавить/удалить станцию', '4 - Назначить поезду маршрут', 
    '5 - Добавить/отцепить вагоны', '6 - Переместить поезд по маршруту', 
    '7 - Вывести список станций', '8 - Вывести список поездов на станции', '9 - Вывести список маршрутов',
    '10 - Вывести список вагонов поезда', '11 - Занять место в вагоне/загрузить вагон',
    '0 - Выйти']
    puts 'Выберите действие'
    puts menu
  end

  def user_choice
    STDIN.gets.chomp.to_i
  end

  def action(choice)
    
    case choice
      when 1
        create_station
      when 2
        create_train
      when 3
        route_manipulation
      when 4
        attach_route
      when 5
        car_manipulation
      when 6
        move_train
      when 7
        show_stations
      when 8
        show_trains_on_station
      when 9
        show_routes
      when 10
        show_cars
      when 11
        car_load
      when 0
        exit
    end
  end

  def create_station
    begin
    puts "Введите название станции: "
    station_name = STDIN.gets.chomp
    @stations << Station.new(station_name)
    puts "Станция #{station_name} успешно создана"
    rescue RuntimeError => e
      puts e.message
      retry
    end
  end

  def create_train
    begin
    puts 'Введите номер поезда'
    train_number = STDIN.gets.chomp
    puts 'Введите тип поезда: 1 - грузовой, 2 - пассажирский'
    train_type = STDIN.gets.chomp.to_i

    case train_type
    when 1
      @trains << CargoTrain.new(train_number)
      puts "Поезд с номером #{train_number} создан" 
    when 2
      @trains << PassengerTrain.new(train_number)
      puts "Поезд с номером #{train_number} создан" 
    else
      raise 'Некорректный тип поезда'
    end
    rescue RuntimeError => e
      puts e.message
      retry
    end
  end
  
  def route_manipulation

    puts 'Выберите действие
    1 - Создать маршрут
    2 - Добавить станцию
    3 - Удалить станцию'

    choice = STDIN.gets.chomp.to_i

    case choice
    when 1
      create_route
    when 2
      add_station_to_route
    when 3
      del_station_from_route
    end
  end

  def create_route
    begin
    puts 'Введите название маршрута'
    route_name = STDIN.gets.chomp
    puts
    puts 'Список доступных станций'
    @stations.each { |station| puts station.name }
    puts "Введите название начальной станции: "
    departure_station_name = STDIN.gets.chomp
    puts "Введите название конечной станции: "
    arrival_station_name = STDIN.gets.chomp
    departure_station = nil
    arrival_station = nil
    @stations.each { |station| departure_station = station if station.name == departure_station_name }
    @stations.each { |station| arrival_station = station if station.name == arrival_station_name }
    @routes << Route.new(departure_station, arrival_station, route_name)
    puts "Маршрут #{@routes.last.name} создан"
    rescue RuntimeError => e
      puts e.message
      retry
    end
  end

  def add_station_to_route
    puts 'Введите название маршрута из доступных'
    @routes.each { |route| puts route.name }
    choice_the_route = STDIN.gets.chomp
    puts
    puts 'Выберите станцию которую хотите добавить'
    @stations.each { |station| puts station.name} 
    choice_the_station = STDIN.gets.chomp
    station_to_add = nil
    route_to_add = nil
    @stations.each { |station| station_to_add = station if station.name == choice_the_station }
    @routes.each { |route| route_to_add = route if route.name == choice_the_route }
    route_to_add.add_station(station_to_add)
    puts "Станция #{station_to_add.name} успешно добавлена к маршруту #{route_to_add.name}"
  end

  def del_station_from_route
    station_to_del = nil
    route_to_del = nil
    puts 'Введите название маршрута из доступных'
    @routes.each { |route| puts route.name }
    choice_the_route = STDIN.gets.chomp
    @routes.each { |route| route_to_del = route if route.name == choice_the_route }
    puts
    puts 'Выберите станцию которую хотите удалить'
    route_to_del.view_route
    choice_the_station = STDIN.gets.chomp
    @stations.each { |station| station_to_del = station if station.name == choice_the_station }
    route_to_del.del_station(station_to_del)
    puts "Станция #{station_to_del.name} успешно удалена из маршрута #{route_to_del.name}"
  end

  def attach_route
    puts 'Выберите поезд'
    @trains.each { |train| puts train.number }
    train_number = STDIN.gets.chomp.to_i
    puts
    train_choice = nil
    @trains.each { |train| train_choice = train if train.number == train_number }
    puts 'Выберите маршрут'
    @routes.each { |route| puts route.name}
    route_name = STDIN.gets.chomp
    route_choice = nil
    @routes.each { |route| route_choice = route if route.name == route_name }
    train_choice.start_route(route_choice)
    puts "Маршрут #{route_choice.name} упспешно назначен позду с номером #{train_choice.number}"
  end

  def car_manipulation
    puts 'Выберите поезд'
    @trains.each { |train| puts train.number }
    train_number = STDIN.gets.chomp
    puts
    train_choice = nil
    @trains.each { |train| train_choice = train if train.number == train_number }
    puts "К поезду #{train_choice.number} сейчас прицеплены следующие вагоны: #{train_choice.waggonage}"
    puts '1 - отцепить вагон
    2 - прицепить вагон'
    choice = STDIN.gets.chomp.to_i
    case choice
    when 1
      puts 'Выберите вагон из прицепленных'
      choice_car = STDIN.gets.chomp.to_i
      car_to_del = nil
      train_choice.waggonage.each { |car| car_to_del = car if choice_car == car.number }
      train_choice.car_unhook(car_to_del)
      puts "Вагон отцеплен"
    when 2
      begin
      puts 'Введите номер вагона'
      car_number = STDIN.gets.chomp.to_i
      if train_choice.type == :cargo
        puts "Введите полный объем вагона"
        capacity = STDIN.gets.chomp.to_i
        car_to_add = CargoCar.new(car_number, capacity)
        train_choice.car_hook(car_to_add)
        puts "Грузовой вагон с номером #{car_to_add.number} прицеплен. Свободный объем - #{car_to_add.available_capacity}"
      elsif train_choice.type == :passenger
        puts "Введите количество мест в вагоне"
        capacity = STDIN.gets.chomp.to_i
        car_to_add = PassengerCar.new(car_number, capacity)
        train_choice.car_hook(car_to_add)
        puts "Пассажирский вагон с номером #{car_to_add.number} прицеплен. Количество свободных мест - #{car_to_add.available_seating_capacity}"
      end
      rescue RuntimeError => e
        e.message
        retry
      end
    end
  end

  def move_train
    puts 'Выберите поезд'
    @trains.each { |train| puts train.number }
    train_number = STDIN.gets.chomp.to_i
    puts
    train_choice = nil
    @trains.each { |train| train_choice = train if train.number == train_number }

    puts '1 - Переместить вперед
    2 - Переместить назад'
    choice = STDIN.gets.chomp.to_i
    case choice
    when 1
      train_choice.run_forward
      puts "Поезд #{train_choice.number} прибыл на станцию #{train_choice.current_station.name}"
    when 2
      train_choice.run_back
      puts "Поезд #{train_choice.number} прибыл на станцию #{train_choice.current_station.name}"
    end
  end 

  def show_stations
    puts "Список станций:"
    puts @stations.each { |station| puts station.name }
  end

  def show_trains_on_station
    puts "Введите название станции: "
    station_name = STDIN.gets.chomp
    station_choice = nil
    @stations.each { |station| station_choice = station if station.name == station_name}

    puts "Список поездов на станции: "
    station_choice.each_train { |train| puts train.number}
  end

  def show_routes
    puts 'Список маршрутов:'
    puts @routes.each { |route| puts route.name }
  end

  def show_cars
    puts 'Выберите поезд'
    @trains.each { |train| puts train.number }
    train_number = STDIN.gets.chomp
    train_choice = nil
    @trains.each { |train| train_choice = train if train.number == train_number }
    if train_choice.type == :cargo
      train_choice.each_car { puts "Вагон с номером #{car.number}. Общий объем - #{car.total_capacity}, 
      свободный объем - #{available_capacity}, занятый объем - #{unavailable_capacity}" }
    elsif train_choice.type == :passenger
      train_choice.each_car { |car| puts "Вагон с номером #{car.number}. Общее количество мест - #{car.total_seating_capacity}, 
      свободных мест - #{car.available_seating_capacity}, занятых мест - #{car.unavailable_seating_capacity}" }
    end
  end
  
  def car_load
    begin
    show_cars
    puts "Выберите вагон используя номер"
    choice = STDIN.gets.chomp.to_i
    car_to_load = nil
    train.each_car { |car| car_to_load = car if car.number == choice}
    if car_to_load.type == :cargo
      puts "Сколько вы хотите загрузить?"
      capacity = STDIN.gets.chomp.to_i
      car_to_load.load_car(capacity)
      puts "Успешно загружено #{capacity}. Свободный объем - #{car_to_load.available_capacity}"
    elsif car_to_load.type == :passenger
      car_to_load.take_a_seat
      puts "Одно место успешно занято. Количество свободных мест - #{car_to_load.available_seating_capacity}"
    end
    rescue RuntimeError => e
      puts e.message
      retry
    end
  end
end

Railway.new.start