class DataList
  attr_reader :elements

  def initialize(elements)
    raise ArgumentError, "Элементы должны быть массивом." unless elements.is_a?(Array)

    @elements = elements
    @selected_indices = []
  end

  # Метод для выделения элемента по номеру
  def select(number)
    raise IndexError, "Индекс вне диапазона." if number < 0 || number >= @elements.size
    @selected_indices << number unless @selected_indices.include?(number)
  end

  # Метод для получения массива ID выделенных элементов
  def get_selected
    @selected_indices.map { |index| @elements[index].id }
  end

  # Метод для получения массива наименований атрибутов (не реализован)
  def get_names
    raise NotImplementedError, "Необходимо реализовать в наследующих классах."
  end

  # Метод для получения объекта DataTable (не реализован)
  def get_data
    raise NotImplementedError, "Необходимо реализовать в наследующих классах."
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
