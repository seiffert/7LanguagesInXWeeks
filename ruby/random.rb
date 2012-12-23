

puts "OK, I chose my number."

x = rand(11)
y = -1

while x != y
    puts "Make your guess"
    y = gets
    y = y.to_i
 
    if x == y
        puts "Correct!"
    else
        if y > x
            puts "Too large"
        else 
            puts "Too small"
        end
    end
end

