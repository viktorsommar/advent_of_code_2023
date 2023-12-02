def foobar
  file_path = "day_1/input.txt"
  puts calculate_sum(file_path)
end

def calculate_sum(file_path)
  input_array = read_file(file_path)
  sum = 0

  input_array.each { sum += extract_double_digit_sum(_1) }

  sum
end

def read_file(file_path)
  File.read(file_path).split("\n")
end

def extract_double_digit_sum(input_line)
  "#{input_line.scan(/\d/).first}#{input_line.scan(/\d/).last}".to_i
end
