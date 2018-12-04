#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

p input.split("\n")
       .map(&:to_i)
       .reduce(:+)
