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
puts "Сумма простых делителей числа = #{simple_divisors_sum(number)}"