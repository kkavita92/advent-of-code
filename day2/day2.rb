#!/usr/bin/env ruby

file_path = File.expand_path("../spreadsheet_input.txt", __FILE__)
input = File.read(file_path)

p input.split("\n")
  .map{ |row| row.split("\t").map(&:to_i) }
  .map { |row| row.max - row.min }
  .reduce(:+)
