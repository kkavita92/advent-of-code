file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

steps = input.strip.to_i
current_position = 0
res = 0
length = 1

50_000_000.times do |num|
  current_position = ((current_position + steps) % length) + 1
  res = num + 1 if current_position == 1
  length += 1
end

p res
