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

def calculate_ribbon(dimensions)
    l, w, h = dimensions

    smallest_dimensions = []

    if l < h && w < h
        smallest_dimensions.append(l).append(w)
    elsif l < w && h < w
        smallest_dimensions.append(l).append(h)
    else
        smallest_dimensions.append(w).append(h)
    end

    feet_of_ribbon = smallest_dimensions[0] * 2 + smallest_dimensions[1] * 2
    feet_of_bow = l * w * h

    return feet_of_ribbon + feet_of_bow
end

total_wrapping_paper = 0
total_ribbon = 0

File.open("2015/data/02.data") do |f|
    f.each_line do |line|
        l, w, h = line.split("x").map { |i| Integer(i) }
        surface_area = (2 * l * w) + (2 * w * h) + (2 * h * l)
        smallest_area = get_smallest_area([l, w, h])
        total_wrapping_paper += surface_area + smallest_area
        total_ribbon += calculate_ribbon([l, w, h])
    end
end

puts total_wrapping_paper
puts total_ribbon
