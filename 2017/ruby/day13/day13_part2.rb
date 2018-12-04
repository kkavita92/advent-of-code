file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

records = {}
delay = 0

input.split("\n").map do |pair|
  pair_arr = pair.split(":")
  records[pair_arr.first.to_i] = pair_arr.last.to_i
end

def escape?(records, delay)
  records.all? { |depth, range| (depth + delay) % ((range - 1) * 2) != 0 }
end

until escape?(records, delay)
  delay += 1
end

p delay
