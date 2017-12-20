file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

instructions = input.strip.split("\n")

list = Hash.new(0)

instructions.each do |inst|
  reg, dir, amt, filler, con_reg, operator, con_value = inst.split(" ")

  if list[con_reg].send(operator, con_value.to_i)
    dir == "inc" ? list[reg] += amt.to_i : list[reg] -= amt.to_i
  end

end

p list.values.max
