file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

list = input.split("\n").map { |pipe| pipe.split("<->") }

programme_hash = {}
list.each do |pipe|
  values = pipe.last.strip.split(",").map(&:to_i)
  programme_hash[pipe.first.to_i] = values
end

groups = 0

while programme_hash.any?

  num_to_check = [programme_hash.keys.first]
  group = []

  while num_to_check.any?
    prog = num_to_check.pop
    group << prog

    num_to_check += programme_hash[prog].reject { |assoc_prog| group.include?(assoc_prog) }
  end

  programme_hash.delete_if { |prog, assoc_prog| group.include?(prog) }
  groups += 1
  
end

p groups
