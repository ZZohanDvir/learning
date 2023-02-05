hash = Hash.new
all_sum = 0

loop do
    puts "Введите название товара\nДля того чтобы увидеть результаты введите слово 'стоп'"
    product = gets.chomp.downcase
    break if product == 'стоп'
    puts 'Введите цену товара'
    price = gets.chomp.to_f
    puts 'Введите количество купленного товара'
    count = gets.chomp.to_f
    hash[product.to_sym] = {count => price}
end

hash.each do |key, value|
    current_product = key.to_s.capitalize
    price_n_count = value.to_a
    current_price = price_n_count[0][1]
    current_count = price_n_count[0][0]
    current_sum = current_count * current_price
    all_sum += current_sum
    puts "#{current_product} - #{current_count} ед. по цене #{current_price} = #{current_sum}" 
end

puts "Общая сумма - #{all_sum}" 
