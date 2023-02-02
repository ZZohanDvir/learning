puts 'Введите длину основания'
a = gets.chomp.to_f
puts 'Введите высоту треугольника'
h = gets.chomp.to_f
triangle_square = (a / 2) * h
#puts "#{triangle_square}" 
#Последнюю строку использовал для проверки результа. В задании значится "возвращать", но return не работает вне метода.