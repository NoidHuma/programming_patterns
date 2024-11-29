def less_than_arithmetic_mean(array)
  return [] if array.empty?

  mean = array.sum.to_f / array.size

  array.select { |element| element < mean }
end