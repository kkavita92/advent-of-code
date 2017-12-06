file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)


banks_list = input.split(' ').map(&:to_i)

states = {}
cycles = 0

until states.has_key?(banks_list)
  states[banks_list] = cycles

  index = banks_list.index(banks_list.max)
  blocks = banks_list[index]
  banks_list[index] = 0

  blocks.times do |i|
    banks_list[(index + i + 1) % banks_list.length] += 1
  end

  cycles += 1
end

p cycles
p cycles - states[banks_list]
