file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)
arr = input.split("\n").map(&:to_i)


def jump(arr)
  position = 0
  counter = 0

  until position > arr.length - 1
    new_position = position + arr[position]
    arr[position] += 1
    counter += 1
    position = new_position
  end

counter
end

p jump(arr)
