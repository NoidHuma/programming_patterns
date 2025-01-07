require_relative '../DataTable'
require_relative "../DeepDup"

class DataList
  include DeepDup

  def initialize(elements)
    raise ArgumentError, "Элементы должны быть массивом." unless elements.is_a?(Array)

    self.elements = elements
    @selected = []
  end

  def elements=(elements)
    unless elements.is_a?(Array)
			raise ArgumentError, "Получен не массив"
		end
    @elements = elements.map { |element| deep_dup(element) }
  end

  # Метод для выделения элемента по номеру
  def select(number)
    raise IndexError, "Индекс вне диапазона." if number < 0 || number >= @elements.size
    @selected << @elements[number] unless @selected.include?(@elements[number])
  end

  def clear_selected
    @selected.clear
  end

  # Метод для получения массива ID выделенных элементов
  def get_selected
    @selected.map { |element| element.id }
  end

  # Метод для получения массива наименований атрибутов (не реализован)
  def get_names
    raise NotImplementedError, "Необходимо реализовать в наследующих классах."
  end

  # Метод для получения объекта DataTable (паттерн шаблон)
  def get_data
    res = @elements.map.with_index do |element, index|
        self.make_row(index)
    end
    DataTable.new(res)
  end
  
  def make_row(index)
      raise ArgumentError, "Метод не реализован"
  end
end

# Пример класса элемента, который будет использоваться в списке
class Element
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end

# Пример использования
elements = [
  Element.new(1, "Элемент 1"),
  Element.new(2, "Элемент 2"),
  Element.new(3, "Элемент 3")
]

data_list = DataList.new(elements)
data_list.select(0) # Выделяем первый элемент
data_list.select(2) # Выделяем третий элемент

puts "Выделенные ID: #{data_list.get_selected}"

# Необходимо реализовать классы-наследники для get_names и get_data
