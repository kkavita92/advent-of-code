file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

instructions = input.strip.split("\n")

reg = Hash.new(0)
index = 0
freq = 0


until index >= instructions.length
   cmd, value_x, value_y = instructions[index].split(" ")

   y = !!(value_y =~ /\d+/) ? value_y.to_i : reg[value_y]

  case cmd
  when 'snd'
     freq = reg[value_x]
   when 'set'
     reg[value_x] = y
   when 'add'
     reg[value_x] += y
   when 'mul'
     reg[value_x] *= y
   when 'mod'
     reg[value_x] = reg[value_x] % y
   when 'rcv'
     break if reg[value_x] != 0
   when 'jgz'
     index += (y - 1) if reg[value_x] > 0
   end

   index += 1
end

p freq
