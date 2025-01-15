require_relative '../../Student' # Подразумевается, что класс Student определен в этом файле
require_relative '../../StudentShort' # Подразумевается, что класс StudentShort определен в этом файле
require_relative '../data_list/DataListStudentShort' # Импортируем класс DataListStudentShort
require_relative 'StudentsListTxt'
require_relative 'StudentsListJson'
require_relative 'StudentsListYaml'

class StudentsList

  def initialize(file_path, storage_strategy)
    @file_path = file_path
    @storage_strategy = storage_strategy
    @students = load_students
  end

  # Чтение всех значений из файла
  def load_students
    @storage_strategy.read_from_file(@file_path)
  end

  # Запись всех значений в файл
  def save_students
    @storage_strategy.write_to_file(@file_path, @students)
  end

  def update_strategy(new_file_path, new_storage_strategy)
    @file_path = new_file_path
    @storage_strategy = new_storage_strategy
    @students = load_students
  end

  # Получить объект класса Student по ID
  def get_student_by_id(id)
    @students.find { |student| student.id == id }
  end

  # Получить список k по счету n объектов класса StudentShort
  def get_k_n_student_short_list(k, n, existing_data_list = nil)
    start_index = (k - 1) * n
    selected_students = @students[start_index, n]
    student_short_list = selected_students.map { |student| StudentShort.new(id: student.id, student_info: student.get_info) }

    if existing_data_list.nil?
      DataListStudentShort.new(student_short_list)
    else
      existing_data_list.elements = student_short_list
      existing_data_list
    end
  end

  # Сортировать элементы по набору ФамилияИнициалы
  def sort_students_by_fullname
    @students.sort_by! { |student| student.fullname }
  end

  # Добавить объект класса Student в список
  def add_student(student)
    if @students.include?(student)
      raise ArgumentError, 'уже существует'
    end
    student.id = generate_new_id(@students)
    @students << student
  end

  # Заменить элемент списка по ID
  def replace_student_by_id(id, new_student)
    index = @students.index { |student| student.id == id }
    if index
      if @students.include?(student)
        raise ArgumentError, 'уже существует'
      end
      new_student.id = id
      @students[index] = new_student
    else
      raise IndexError, "Студент с ID #{id} не найден."
    end
  end

  # Удалить элемент списка по ID
  def delete_student_by_id(id)
    @students.reject! { |student| student.id == id }
  end

  # Получить количество элементов
  def size
    @students.size
  end

  private

  # Генерация нового ID (можно изменить логику по необходимости)
  def generate_new_id(objects)
    (objects.map(&:id).max || 0) + 1
  end
end