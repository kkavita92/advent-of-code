file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

lengths = input.strip.bytes.concat [17, 31, 73, 47, 23]

pos = 0
skip = 0
list = (0..255).to_a

64.times do
  lengths.each do |length|
    list.rotate!(pos)
    list[0, length] = list[0, length].reverse
    list.rotate!(-pos)

    pos += skip + length
    skip += 1
  end
end

puts list.each_slice(16).map { |hash| hash.reduce(:^).to_s(16).rjust(2, '0') }.join
