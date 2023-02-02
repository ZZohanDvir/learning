puts 'Введите коэффициент a'
a = gets.chomp.to_f
puts 'Введите коэффициент a'
b = gets.chomp.to_f
puts 'Введите коэффициент a'
c = gets.chomp.to_f

d = (b ** 2) - (4 * a * c)

if d < 0
    abort 'Нет корней'
elsif d == 0
    result = -(b / (2 * a))
    puts result
else
    result1 = (-b + Math.sqrt(d)) / (2 * a)
    result2 = (-b - Math.sqrt(d)) / (2 * a)
    if result2 > result1
        puts result1
        puts result2
    else
        puts result2
        puts result1
    end
end 
