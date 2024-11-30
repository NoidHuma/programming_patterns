class MyArray
  
  
  def initialize(array)
    @array = array
  end
  
  
  def my_detect()
    for i in 0...@array.length do
      return @array[i] if yield(@array[i])
    end
    nil
  end


  def my_map()
    result = []
    for i in 0...@array.length do
      result << yield(@array[i])
    end
    result
  end


  def my_select()
    result = []
    for i in 0...@array.length do
      result << @array[i] if yield(@array[i])
    end
    result
  end


  def my_drop_while
  result = []
  drop = true
  
  for i in 0...@array.length do
    if drop
      if yield(@array[i])
        next 
      else
        drop = false 
      end
    end
    
    result << @array[i] unless drop
  end
  
  result
  end

  
  def my_sort()
  sorted_array = @array.dup

  for i in 0...sorted_array.length do
    for j in 0...(sorted_array.length - i - 1) do
      if yield(sorted_array[j], sorted_array[j + 1]) > 0
        temp = sorted_array[j]
        sorted_array[j] = sorted_array[j + 1]
        sorted_array[j + 1] = temp
      end
    end
  end
  sorted_array
  end
  
  
  def my_max
  max_value = nil 

  for i in 0...@array.length do
    current_value = @array[i] 
    if max_value.nil? || yield(current_value, max_value) > 0
      max_value = current_value
    end
  end

  max_value
  end

end