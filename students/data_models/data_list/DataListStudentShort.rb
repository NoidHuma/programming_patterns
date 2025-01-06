require_relative 'DataList'
require_relative '../DataTable'
require_relative '../../StudentShort'

class DataListStudentShort < DataList
  # Метод для получения массива наименований атрибутов (кроме ID)
  def get_names
    # В этом методе предполагается, что все элементы являются объектами StudentShort
    # Получаем наименования атрибутов, кроме ID
    ["Fullname", "Contact", "Git"] # Эта строка может быть изменена в зависимости от вашей структуры атрибутов
  end

  # Метод для получения объекта DataTable
  def get_data
    data_table_array = @elements.map.with_index do |student_short, index|
      # Порядковый номер, fullname, contact, git
      [
        index + 1,
        student_short.fullname,
        student_short.contact,
        student_short.git
      ]
    end

    # Создаем объект DataTable с полученным массивом
    DataTable.new(data_table_array)
  end
end

# Пример использования
students = [
  StudentShort.new(id: 1, student_info: "Fullname = John Doe, Contact = john@example.com, Git = https://github.com/johndoe"),
  StudentShort.new(id: 2, student_info: "Fullname = Jane Smith, Contact = jane@example.com, Git = https://github.com/janesmith"),
  StudentShort.new(id: 3, student_info: "Fullname = Alice Johnson, Contact = alice@example.com, Git = https://github.com/alicejohnson")
]

data_list = DataListStudentShort.new(students)
puts "Имена атрибутов: #{data_list.get_names.join(', ')}"
data_table = data_list.get_data
puts "Данные таблицы:\n#{data_table}"
