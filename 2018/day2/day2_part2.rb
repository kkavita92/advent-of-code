#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

ids = input.split("\n")
id_idx = ids.length - 1

ids.each do |id|
  id_idx = ids.length - 1

  #comparing one id with another id
  while id_idx >= 0
    word_idx = ids.first.length - 1
    diff = 0

    #checks difference between every letter
    while word_idx >= 0
      diff += 1 if id[word_idx] != ids[id_idx][word_idx]
      word_idx -= 1
    end

    if diff == 1
      p id
      p ids[id_idx]
    end

    id_idx -= 1
  end

end
