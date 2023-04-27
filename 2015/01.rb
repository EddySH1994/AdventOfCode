data = File.read("2015/data/01.data")

# Part One

floor_number = 0

data.each_char do |c|
    if c == "("
        floor_number += 1
    else
        floor_number -= 1
    end
end

puts floor_number

# Part Two

position = 0
floor_number = 0

data.each_char do |c|

    position += 1

    if c == "("
        floor_number += 1
    else
        floor_number -= 1
    end

    if floor_number < 0
        break
    end
end

puts position