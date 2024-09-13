STDOUT.sync = true
# Вариант 7

# Метод 1. Найти сумму простых делителей числа. 

# Нахождение делителей числа
def num_divisors(number)
	if number == 0 then
		return []
	end
	divisors = []
	for i in 1..number
		divisors << i if number % i == 0
	end
	return divisors
end
		

def simple_divisors_sum(number)
	if number <= 1 then
		return 0
	end
	sum = 0
	divisors = num_divisors(number)
	for div in divisors
		num = num_divisors(div)
		sum += div if num.length == 2
  end
  return sum
end

puts "Введите число:"
number = gets.to_i
puts "Сумма простых делителей числа: #{simple_divisors_sum(number)}"

# Метод 2. Найти количество нечетных цифр числа, больших 3.

def count_uneven_greater_three(number)
	count = 0
	while number != 0
		digit = number % 10
		count += 1 if (digit > 3 and digit % 2 != 0)
		number /= 10
	end
	return count
end

puts "Введите число:"
number = gets.to_i
puts "Количество нечетных цифр числа, больших 3: #{count_uneven_greater_three(number)}"

