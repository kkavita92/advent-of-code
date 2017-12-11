
file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

directions = input.strip.split(",")

x = 0
y = 0
start = [0, 0]
distances = []

def distance(start, finish)
  y = finish[1] - start[1]
  x = finish[0] - start[0]
  [x.abs, y.abs, (y - x).abs].max
end

directions.each { |direction|
case direction
when "nw"
  x -= 1
when "n"
  y += 1
when "ne"
  x += 1
  y += 1
when "sw"
  y -= 1
  x -= 1
when "s"
  y -= 1
when "se"
  x += 1
else
  nil
end

distances << distance(start, [x, y])
}

p distances.max
