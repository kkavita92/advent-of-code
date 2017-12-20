file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path).strip

str = input.gsub!(/!./, "").split("") ##characters cancelled

inGarbage = false
cleaned = []
garbage_count = 0
score = 0
depth = 0

while str.any?
  x = str.shift

  if inGarbage
    x == ">" ? inGarbage = false : garbage_count += 1
  else
    if x == "{"
      depth += 1
      score += depth
    elsif x == "}"
      depth -= 1
    elsif x == "<"
      inGarbage = true
    end
  end
end

p score # Part 1
p garbage # Part 2
