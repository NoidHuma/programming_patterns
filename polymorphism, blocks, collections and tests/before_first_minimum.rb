def before_first_minimum(array)
  return [] if array.empty?

  min_index = array.index(array.min)

  array[0...min_index]
end
