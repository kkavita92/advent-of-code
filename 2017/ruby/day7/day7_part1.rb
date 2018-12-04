file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

programs = input.split("\n")
has_children = programs.select { |program| program.include?("->")}

parents = []
children = []

has_children.each do |program|
  parents << program.split(" ").first
  children += program.split("->").last.split(",").map { |child| child.strip }
end

p parents - children
