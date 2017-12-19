file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

steps = input.strip.to_i
current_position = 0
buffer = [0]

2017.times do |num|
  current_position = ((current_position + steps) % buffer.length) + 1
  buffer.insert(current_position, num + 1)
end

p buffer[current_position + 1]
