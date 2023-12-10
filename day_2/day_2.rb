FILE_PATH = "day_2/input.txt"
MAX_CUBES = {
  red: 12,
  green: 13,
  blue: 14,
}

def part_1_solution
  puts calculate_sum_of_ids
end

def part_2_solution
  puts calculate_sum_of_power
end

private

def calculate_sum_of_power
  input_array = read_file
  power = []

  input_array.each do |input_line|
    power.push(save_max_number(input_line))
  end

  power.sum
end

def calculate_sum_of_ids
  input_array = read_file
  ids = []

  input_array.each do |input_line|
    ids = save_game_id(input_line, ids)
  end

  ids.sum
end

def save_max_number(input)
  hash = {}
  input.scan(/(\d+)\s*(green|blue|red)/).each do |count, color|
    current_max = hash[color] || 0
    hash[color] = [current_max, count.to_i].max
  end

  hash.values.reduce(:*)
end

def save_game_id(input, ids)
  if save_game_id?(input)
    ids.push(input.scan(/\d+/).first.to_i)
  end

  ids
end

def save_game_id?(input)
  input.scan(/(\d+)\s*(green|blue|red)/) do |count, color|
    return false if count.to_i > MAX_CUBES[color.to_sym]
  end

  true
end

def read_file
  File.read(FILE_PATH).split("\n")
end
