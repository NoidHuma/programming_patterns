class DataTable
  # Инициализация двумерного массива с данными через конструктор
  def initialize(data)
    # Проверка, чтобы убедиться, что переданные данные являются двумерным массивом
    unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
      raise ArgumentError, "Данные должны быть двумерным массивом."
    end

    @data = data
  end

  # Метод для получения размера таблицы (количество строк и столбцов)
  def size
    { rows: @data.size, columns: @data.empty? ? 0 : @data.first.size }
  end

  # Метод для получения значения по строке и столбцу
  def get_value(row, column)
    raise IndexError, "Индекс строки вне диапазона." if row < 0 || row >= @data.size
    raise IndexError, "Индекс столбца вне диапазона." if column < 0 || column >= @data[row].size

    @data[row][column]
  end

  # Метод для вывода таблицы в виде строк
  def to_s
    @data.map { |row| row.join(", ") }.join("\n")
  end
end


