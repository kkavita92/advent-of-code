file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

generators = input.split("\n")

a = generators.first.to_i
b = generators.last.to_i
count = 0

def next_value(last_value, factor, value_check)
  begin
    last_value = (last_value * factor) % 2147483647
  end until last_value % value_check == 0

  last_value
end

5000000.times do
  a = next_value(a, 16807, 4)
  b = next_value(b, 48271, 8)

  count += 1 if a & 65535 == b & 65535
end

p count
