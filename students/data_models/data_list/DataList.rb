require_relative '../DataTable'
require_relative "../DeepDup"

class DataList
  include DeepDup

  attr_accessor :observers, :count

  def initialize(elements)
    raise ArgumentError, "Элементы должны быть массивом." unless elements.is_a?(Array)

    self.elements = elements
    @columns = self.get_names
    @selected = []
    self.observers = []
  end

  def add_observer(observer)
    self.observers << observer
  end
  def notify(data)
    self.observers.each do |observer|
      observer.set_table_params(data.get_names, self.count)
      observer.set_table_data(data.get_data)
    end
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
    res = []
    res << get_names()
    @elements.map.with_index do |element, index|
      res << self.make_row(index)
    end
    DataTable.new(res)
  end
  
  protected
  def make_row(index)
      raise NotImplementedError, "Необходимо реализовать в наследующих классах."
  end
end

