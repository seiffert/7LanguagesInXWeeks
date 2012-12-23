a = (1..16).entries

a.each do |elm|
    index = a.index(elm)
    if index % 4 == 0
        puts "#{a[index]} #{a[index+1]} #{a[index+2]} #{a[index+3]}"
    end
end
