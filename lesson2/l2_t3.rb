fibonacci = [0, 1]

loop do
    fibonacci_new = fibonacci[-2] + fibonacci[-1]
    break if fibonacci_new > 100
    fibonacci << fibonacci_new
end

puts fibonacci 