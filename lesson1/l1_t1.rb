puts 'Как вас зовут?'
name = gets.chomp
puts 'Каков ваш рост? (Ответ дайте в сантиметрах)'
height = gets.chomp.to_i
ideal_weight = ((height - 110) * 1.15).to_i

if ideal_weight < 0 
    puts 'Ваш вес уже оптимальный'
else
    puts "#{name}, ваш идеальный вес - #{ideal_weight} килограмм!"
end