#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

ids = input.split("\n")

twos = 0
threes = 0

ids.each do |id|
  letters = id.chars.uniq
  counts = letters.map { |letter| id.count(letter) }

  twos += 1 if counts.include?(2)
  threes += 1 if counts.include?(3)

end

p twos * threes
