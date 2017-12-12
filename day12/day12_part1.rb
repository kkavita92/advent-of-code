file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

list = input.split("\n").map { |pipe| pipe.split("<->") }

programme_hash = {}
list.each do |pipe|
  values = pipe.last.strip.split(",").map(&:to_i)
  programme_hash[pipe.first.to_i] = values
end

num_to_check = [0]
group = []

while num_to_check.any?
  prog = num_to_check.pop
  group << prog

  num_to_check += programme_hash[prog].reject { |assoc_prog| group.include?(assoc_prog) }
end

p group.size
