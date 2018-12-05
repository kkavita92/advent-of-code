#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path).split("\n").first

types = input.downcase.chars.uniq
arr = []

types.each do |type|

  trimmed = input.gsub(type, "").gsub(type.upcase, "")

  loop do
    polymer_length = trimmed.length

    trimmed.gsub!(/([A-z])\1+/i) do |units|
      letter = units[0]
      pair = letter.downcase + letter.upcase

      units.gsub(pair, "")
           .gsub(pair.reverse, "")
    end

    break if polymer_length == trimmed.length
  end

  arr << trimmed.length

end

p arr.min
