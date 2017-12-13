file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

records = {}

input.split("\n").map do |pair|
  pair_arr = pair.split(":")
  records[pair_arr.first.to_i] = pair_arr.last.to_i
end

s = records.map { |depth, range| depth * range if depth % ((range - 1) * 2) == 0 }
total_s = s.compact.reduce(:+)

p total_s
