#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

changes = input.split("\n")

total = 0
frequencies = []

while true
  changes.each do |change|
    total += change.to_i

    if frequencies.include?(total)
      p total
      exit
    end

    frequencies << total
  end

end
