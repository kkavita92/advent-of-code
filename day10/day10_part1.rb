file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

lengths = input.split(',').map(&:to_i)

pos = 0
skip = 0
list = (0..255).to_a

lengths.each do |length|
  list.rotate!(pos)
  list[0, length] = list[0, length].reverse
  list.rotate!(-pos)

  pos += skip + length
  skip += 1
end

puts pos
puts list[0] * list[1]
