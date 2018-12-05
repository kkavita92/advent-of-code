#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path).split("\n").first

loop do
  polymer_length = input.length

  input.gsub!(/([A-z])\1+/i) do |units|
    letter = units[0]
    pair = letter.downcase + letter.upcase

    units.gsub(pair, "")
         .gsub(pair.reverse, "")
  end

  break if polymer_length == input.length
end


p input.length
