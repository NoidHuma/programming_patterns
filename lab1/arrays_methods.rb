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

