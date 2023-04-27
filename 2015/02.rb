def get_smallest_area(dimensions)
    l, w, h = dimensions

    lw = l * w
    lh = l * h
    wh = w * h

    areas = [lw, lh, wh]
    smallest_area = areas.first

    areas.each do |area|
        if area < smallest_area
            smallest_area = area
        end
    end

    return smallest_area
end

def calculate_ribbon_length(dimensions)
    l, w, h = dimensions

    feet_of_ribbon = 0

    if l < h && w < h
        feet_of_ribbon = l + l + w + w
    elsif l < w && h < w
        feet_of_ribbon = l + l + h + h
    else
        feet_of_ribbon = w + w + h + h
    end

    feet_of_bow = l * w * h

    return feet_of_ribbon + feet_of_bow
end


# Part One

total_wrapping_paper = 0

File.open("2015/data/02.data") do |f|
    f.each_line do |line|
        l, w, h = line.split("x").map { |i| Integer(i) }
        surface_area = (2 * l * w) + (2 * w * h) + (2 * h * l)
        smallest_area = get_smallest_area([l, w, h])
        total_wrapping_paper += surface_area + smallest_area
    end
end

puts total_wrapping_paper


# Part Two

total_ribbon = 0

File.open("2015/data/02.data") do |f|
    f.each_line do |line|
        l, w, h = line.split("x").map { |i| Integer(i) }
        total_ribbon += calculate_ribbon_length([l, w, h])
    end
end

puts total_ribbon
