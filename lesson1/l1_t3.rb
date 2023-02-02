flag1 = false
flag2 = false

puts 'Введите значение длины первой стороны'
first = gets.chomp.to_f
puts 'Введите значение длины второй стороны'
scnd = gets.chomp.to_f
puts 'Введите значение длины третьей стороны'
third = gets.chomp.to_f

abort 'Ваш треугольник равнобедренный и равносторонний.' if first == scnd && scnd == third


flag1 = true if first == scnd || first == third || scnd == third
flag2 = true if ((first ** 2 + scnd ** 2) == (third ** 2)) || ((first ** 2 + third ** 2) == (scnd ** 2)) || ((scnd ** 2 + third ** 2) == (first **2))

if flag1 == false && flag2 == false
    abort 'Ваш треугольник не имеет особенностей'
elsif flag1 == true && flag2 == true
    abort 'Ваш треугольник равобедренный и прямоугольный'
elsif flag1 == true
    abort 'Ваш тругольник равнобедренный'
else
    puts 'Ваш треугольник прямоугольный'
end