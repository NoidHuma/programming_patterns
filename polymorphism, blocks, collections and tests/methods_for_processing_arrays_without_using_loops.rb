STDOUT.sync = true

require "json"

def left_cyclic_shift(array)
  return array if array.empty?

  array.rotate(3)
end

def before_first_minimum(array)
  return [] if array.empty?

  min_index = array.index(array.min)

  array[0...min_index]
end

def is_global_maximum?(array,index)
  return array[index] == array.max
end

def less_than_arithmetic_mean(array)
  return [] if array.empty?

  mean = array.sum.to_f / array.size

  array.select { |element| element < mean }
end

def occurr_more_than_three_times(array)
  frequency = array.tally
  
  frequency.select { |_, count| count > 3 }.keys
end

def keyboard_input_array
  array = []
  puts "Введите элементы массива:"
  el = gets.chomp
  while el!=""
    array << el.to_i
	el = gets.chomp
  end
  array
end

def keyboard_input_method_and_array
  puts "Выберите метод."
  puts "1) left_cyclic_shift(array)"
  puts "2) before_first_minimum(array)"
  puts "3) is_global_maximum?(array,index)"
  puts "4) less_than_arithmetic_mean(array)"
  puts "5) occurr_more_than_three_times(array)"
  puts "Введите число от 1 до 5:"
  method = gets.chomp
  case method
    when "1"
	  array = keyboard_input_array
	  return left_cyclic_shift(array)
	when "2"
	  array = keyboard_input_array
	  return before_first_minimum(array)
	when "3"
	  array = keyboard_input_array
      puts "Введите индекс:"
	  index = gets.chomp.to_i
	  return is_global_maximum?(array,index)
	when "4"
	  array = keyboard_input_array
	  return less_than_arithmetic_mean(array)
	when "5"
	  array = keyboard_input_array
	  return occurr_more_than_three_times(array)
	else
	  puts "Ввод чисел только от 1 до 5!"
  end
end

def read_method_and_array_from_file(file_name)
  File.open(file_name,"r") do |file|
    hash = file.read
	hash = JSON.parse(hash)
	return left_cyclic_shift(hash["array"]) if hash["method"] == 1
	return before_first_minimum(hash["array"]) if hash["method"] == 2
    return is_global_maximum?(hash["array"],hash["index"]) if hash["method"] == 3
	return less_than_arithmetic_mean(hash["array"]) if hash["method"] == 4
	return occurr_more_than_three_times(hash["array"]) if hash["method"] == 5
	"Номер метода - число от 1 до 5!" if hash["method"] > 5 || hash["method"] < 1
  end
end

def keyboard_input_or_read_from_file 
  if ARGV.length > 0 then
    puts "#{read_method_and_array_from_file(ARGV[0])}"
  else
  
    puts "#{keyboard_input_method_and_array}"
  end
end

keyboard_input_or_read_from_file
