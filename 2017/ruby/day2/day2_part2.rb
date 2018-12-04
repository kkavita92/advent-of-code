#!/usr/bin/env ruby

file_path = File.expand_path("../spreadsheet_input.txt", __FILE__)
input = File.read(file_path)

def find_divisible_digits_result(array)
  array = array.combination(2).to_a
  selected_num = array.select { |pair| pair.max % pair.min == 0 }.flatten
  selected_num.max/selected_num.min
end

p input.split("\n")
  .map{ |row| row.split("\t").map(&:to_i) }
  .map{ |row| find_divisible_digits_result(row) }
  .reduce(:+)
