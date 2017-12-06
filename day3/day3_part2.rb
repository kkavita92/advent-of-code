# Solved without code - using integer sequencing
# Code solution taken from gchan - needs to be looked at!
# Identified bug for number less than 17

target = 16
dimension = Math.sqrt(target).ceil

grid = Array.new(dimension) { Array.new(dimension) } # creates grid of nil values


start = dimension / 2
p start
x = y = start

dirs = [:right, :up, :left, :down]
dir = dirs[0]

def move(x, y, dir)
  case dir
  when :right
    x += 1
  when :up
    y -= 1
  when :left
    x -= 1
  when :down
    y += 1
  end

  [x, y]
end

target.times do |i|
  value = [x - 1, x, x + 1]
    .product([y - 1, y, y+1])
    .map { |x, y| grid[y][x] }
    .compact
    .inject(:+)

  puts value
  value ||= 1
  grid[y][x] = value

  break if value > target

  next_dir = dirs[(dirs.index(dir) + 1) % dirs.length]
  x1, y1 = move(x, y, next_dir)
  dir = next_dir if grid[y1][x1].nil?

  x, y = move(x, y, dir)
end

puts grid[y][x]
