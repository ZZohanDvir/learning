hash = Hash.new
j = 0

for i in 'a'..'z'
    j += 1
    hash[i] = j
end

puts hash