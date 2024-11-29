def occurr_more_than_three_times(array)
  frequency = array.tally
  
  frequency.select { |_, count| count > 3 }.keys
end