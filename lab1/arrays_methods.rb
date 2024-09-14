# Написать метод, который находит минимальный элемент массива

def min_elem(arr)
	min = arr[0]
	for i in 1...arr.length
		if min > arr[i] then
			min = arr[i]
		end
	end
	return min
end

# Написать метод, который находит номер первого положительного элемента массива

def first_positive_elem(arr)
	for i in 0...arr.size
		if arr[i] > 0
		return i
		end
	end
	return nil
end


def read_array(file)
	array = []
	begin
		file_object = File.open(file, 'r')
		while (line = file_object.gets)
			elements = line.split
			for elem in elements
				array << elem.to_i
			end
		end
		file_object.close
    rescue 
    puts "Файл не существует"
    exit -1
	end
	return array
end

# Написать программу, которая принимает как аргумент два значения. Первое значение говорит, какой из методов задачи 5 выполнить, второй говорит о том, откуда читать список (аргументом должен быть написан адрес файла). Далее необходимо прочитать массив и выполнить метод.

if ARGV.size == 2
	method = ARGV[0].to_i
	file = ARGV[1]
    array = read_array(file)
    if method == 1
		puts "Минимальный элемент: #{min_elem(array)}"
    elsif method == 2
		puts "Номер первого положительного элемента: #{first_positive_elem(array)}"
    else
		puts "Введите номер 1 или 2"
    end
else
	puts "Введите все аргументы программы: номер метода, который нужно выполнить и путь к файлу с массивом"
end