require_relative 'my_array_methods'

RSpec.describe MyArray do
  let(:my_array) { MyArray.new([1, 2, 3, 4, 5]) }

  describe '#my_detect' do
    it 'returns the first element that matches the condition' do
      result = my_array.my_detect { |item| item > 3 }
      expect(result).to eq(4)
    end

    it 'returns nil if no element matches the condition' do
      result = my_array.my_detect { |item| item > 5 }
      expect(result).to be_nil
    end
  end

  describe '#my_map' do
    it 'returns a new array with the results of running the block once for every element' do
      result = my_array.my_map { |item| item * 2 }
      expect(result).to eq([2, 4, 6, 8, 10])
    end
  end

  describe '#my_select' do
    it 'returns a new array containing all elements for which the block returns true' do
      result = my_array.my_select { |item| item.even? }
      expect(result).to eq([2, 4])
    end

    it 'returns an empty array if no elements match' do
      result = my_array.my_select { |item| item > 5 }
      expect(result).to eq([])
    end
  end

  describe '#my_drop_while' do
    it 'drops elements while the block returns true' do
      result = my_array.my_drop_while { |item| item < 3 }
      expect(result).to eq([3, 4, 5])
    end

    it 'returns the entire array if all elements match' do
      result = my_array.my_drop_while { |item| item < 6 }
      expect(result).to eq([])
    end
  end

  describe '#my_sort' do
    it 'returns a sorted array based on the block' do
      result = my_array.my_sort { |a, b| b <=> a } # Сортировка по убыванию
      expect(result).to eq([5, 4, 3, 2, 1])
    end
    
    it 'returns an empty array when sorting an empty array' do
      empty_array = MyArray.new([])
      result = empty_array.my_sort { |a, b| a <=> b }
      expect(result).to eq([])
    end
  end

  describe '#my_max' do
    it 'returns the maximum element based on the block' do
      result = my_array.my_max { |a, b| a <=> b }
      expect(result).to eq(5)
    end

    it 'returns nil for an empty array' do
      empty_array = MyArray.new([])
      result = empty_array.my_max { |a, b| a <=> b }
      expect(result).to be_nil
    end
  end
end