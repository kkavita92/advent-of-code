#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

grid = Array.new(1000) { Array.new(1000, 0) }
claims = input.split("\n")

claims.each do |claim|
  coord, dim = claim.split("@").last.split(": ")
  x, y = coord.split(",").map(&:to_i)
  w, h = dim.split("x").map(&:to_i)

  w.times do |x_coord|
    h.times do |y_coord|
      grid[x + x_coord][y + y_coord] += 1
    end
  end

end

p grid.flatten.select{ |inch| inch > 1 }.length
