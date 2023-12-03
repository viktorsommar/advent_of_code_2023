MAX_CUBES = {
  red: 12,
  green: 13,
  blue: 14,
}

def find_sum_of_game_ids
  file_path = "day_2/input.txt"
  puts calculate_sum_of_ids(file_path)
end

def calculate_sum_of_ids(file_path)
  input_array = read_file(file_path)
  ids = []

  input_array.each do |input_line|
    save_game_id(input_line)
  end

  ids.sum
end

def save_game_id(input)
  if save_game_id?(input)
    ids.push(input.scan(/\d+/).first.to_i)
  end
end

def save_game_id?(input)
  input.scan(/(\d+)\s*(green|blue|red)/) do |count, color|
    return false if count.to_i > MAX_CUBES[color.to_sym]
  end

  true
end

def read_file(file_path)
  File.read(file_path).split("\n")
end
