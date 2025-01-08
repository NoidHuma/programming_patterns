require_relative '../../Student' # Подразумевается, что класс Student определен в этом файле
require_relative '../../StudentShort' # Подразумевается, что класс StudentShort определен в этом файле
require_relative '../data_list/DataListStudentShort' # Импортируем класс DataListStudentShort

class StudentsListTxt

  def initialize(file_path)
    @file_path = file_path
    @students = read_from_file
  end

  # Чтение всех значений из файла
  def read_from_file
    students = []
    return students unless File.exist?(@file_path)
    File.readlines(@file_path).each do |line|
      student = Student.initialize_from_string(line.strip)
      student.id = generate_new_id(students)
      students << student
    end
    return students
  end

  # Запись всех значений в файл
  def write_to_file
    File.open(@file_path, 'w') do |file|
      @students.each do |student|
        file.puts(student.to_s) # Предполагается, что метод to_s возвращает строку для записи
      end
    end
  end

  # Получить объект класса Student по ID
  def find_student_by_id(id)
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
    student.id = generate_new_id(@students)
    @students << student
  end

  # Заменить элемент списка по ID
  def replace_student_by_id(id, new_student)
    index = @students.index { |student| student.id == id }
    if index
      new_student.id = id
      @students[index] = new_student
    else
      raise "Студент с ID #{id} не найден."
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


students_list_txt = StudentsListTxt.new("../../files/students_list.txt")
puts students_list_txt.find_student_by_id(2)
new_student = Student.initialize_from_string("id: 3, surname: Frigor, name: Nik, patronymic: Tich, phone: +79649201670, telegram: https://t.me/noihduma, email: nikitag.small2005@gmail.com, git: https://github.com/NoihDuma")
students_list_txt.add_student(new_student)
new_student = Student.initialize_from_string("id: 4, surname: Gri, name: Aikgor, patronymic: Vich, phone: +79750312781, telegram: https://t.me/noih1, email: nik.small2005@gmail.com, git: https://github.com/Noih")
students_list_txt.add_student(new_student)
new_student = Student.initialize_from_string("id: 4, surname: Gri, name: Nik, patronymic: Hi, phone: +79750312781, telegram: https://t.me/noih2, email: nik.small2005@gmail.com, git: https://github.com/Noih")
students_list_txt.replace_student_by_id(1, new_student)
students_list_txt.delete_student_by_id(2)
puts students_list_txt.size
students_short_list = students_list_txt.get_k_n_student_short_list(1, 2)
puts students_short_list.get_data
students_list_txt.sort_students_by_fullname
students_list_txt.write_to_file
