# Интерфейс стратегии
class SortingStrategy
	def sort(data)
		raise NotImplementedError, "Метод sort должен быть реализован!"
	end
end

# Конкретные стратегии
class AscendingSort < SortingStrategy
	def sort(data)
		data.sort
	end
end

class DescendingSort < SortingStrategy
	def sort(data)
		data.sort.reverse
	end
end

# Контекст стратегии
class SortedList
	attr_accessor :strategy

	def initialize(strategy)
		@strategy = strategy
	end

	def sort(data)
		@strategy.sort(data)
	end
end

data = [5, 3, 8, 1, 2]

ascending_sort = AscendingSort.new
sorted_list = SortedList.new(ascending_sort)
puts "По возрастанию: #{sorted_list.sort(data)}"

descending_sort = DescendingSort.new
sorted_list.strategy = descending_sort
puts "По убыванию: #{sorted_list.sort(data)}"