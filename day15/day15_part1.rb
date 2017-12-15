file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

generators = input.split("\n")

a = generators.first.to_i
b = generators.last.to_i
count = 0

def next_value(last_value, factor)
  (last_value * factor) % 2147483647
end

40000000.times do
  a = next_value(a, 16807)
  b = next_value(b, 48271)

  count += 1 if a & 65535 == b & 65535
end

p count
