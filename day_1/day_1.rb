CONVERTER = {
  one: 1,
  two: 2,
  three: 3,
  four: 4,
  five: 5,
  six: 6,
  seven: 7,
  eight: 8,
  nine: 9,
}

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
  matches = input_line.scan(/(?=(\d|#{CONVERTER.keys.join("|")}))/).flatten

  first_digit = CONVERTER.has_key?(matches.first.to_sym) ? CONVERTER[matches.first.to_sym] : matches.first
  second_digit = CONVERTER.has_key?(matches.last.to_sym) ? CONVERTER[matches.last.to_sym] : matches.last

  "#{first_digit}#{second_digit}".to_i
end
