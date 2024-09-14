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

