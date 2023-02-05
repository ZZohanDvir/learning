months = {january: 31, 
    february: 28,
    march: 31,
    april: 30,
    may: 31,
    june: 30,
    july: 31,
    august: 31,
    september: 30,
    october: 31,
    november: 30,
    december: 31
}
index_number = 0
flag = false
j= 0

puts 'Введите год'
year = gets.chomp.to_i
puts 'Введите месяц (по английски)'
month = gets.chomp.downcase.to_sym
puts 'Введите число'
day = gets.chomp.to_i

if year % 400 == 0
    flag = true
elsif year % 4 == 0 && year % 100 != 0
    flag = true
end

months[:february] = 29 if flag == true

months.each_key do |i|
    break if months.to_a[j][0] == month
    j += 1
    index_number += months[i]
end

index_number += day

puts index_number