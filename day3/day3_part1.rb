def position(input)
  rows = Math.sqrt(input).ceil
  numbers_used = (rows - 1) * (rows - 1)
  numbers_left = input - numbers_used
  p rows
  p "NUMBERS LEFT: #{numbers_left}"
  last_coordinate = diagonal_coordinate(rows - 1)
  p last_coordinate
  find_position(last_coordinate, rows, numbers_left)
end

def diagonal_coordinate(rows)
  coordinate = (rows / 2).floor
  [coordinate, -coordinate]
end

def find_position(last_coordinate, grid_dimension, numbers_left)
  halfway = grid_dimension / 2
  p "HALFWAY: #{halfway}"
  x = last_coordinate[0]
  p "FIRST #{x}"
  y = last_coordinate[1]

    return [x + 1, y] if numbers_left == 1
    if numbers_left <= halfway - y + 1
      x += 1
      (numbers_left - 1).times { y += 1 }
      return [x, y]
    elsif numbers_left <= (halfway - y + 1) + (grid_dimension - 1)
      x += 1
      (halfway - y).times { y += 1 }
      (numbers_left - grid_dimension).times { x -= 1 }
      return [x, y]
    elsif numbers_left <= (halfway - y + 1) + ((grid_dimension - 1) * 2)
      x += 1
      (halfway - y).times { y += 1 }
      (grid_dimension - 1).times { x -= 1 }
      (numbers_left - (grid_dimension * 2 - 2)).times { y -= 1 }
      return [x, y]
    else
      x += 1
      (halfway - y).times { y += 1 }
      (grid_dimension - 1).times { x -= 1 }
      (grid_dimension - 1).times { y -= 1 }
      (numbers_left - (grid_dimension * 3 - 3)).times { x += 1 }
      return [x, y]
    end
end

def calculate_distance(start_point, end_point)
  (start_point[0] - end_point[0]).abs + (start_point[1] - end_point[1]).abs
end

p position(37)
p calculate_distance([0,0], [301, 25])
