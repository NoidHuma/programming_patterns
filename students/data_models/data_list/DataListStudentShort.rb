require_relative 'DataList'
require_relative '../../StudentShort'

class DataListStudentShort < DataList
  # Метод для получения массива наименований атрибутов (кроме ID)
  def get_names
    # В этом методе предполагается, что все элементы являются объектами StudentShort
    # Получаем наименования атрибутов, кроме ID
    ["Fullname", "Contact", "Git"] # Эта строка может быть изменена в зависимости от вашей структуры атрибутов
  end

  private
  # переопределяем make_row
  def make_row(index)
    [index + 1, @elements[index].fullname, @elements[index].git, @elements[index].contact]
  end
end


