require_relative '../../Student' # Подразумевается, что класс Student определен в этом файле
require_relative 'interface'

class StudentsListTxt < StorageStrategy

  # Чтение всех значений из файла
  def read_from_file(file_path)
    students = []
    return students unless File.exist?(file_path)
    File.readlines(file_path).each do |line|
      student = Student.initialize_from_string(line.strip)
      student.id = (students.map(&:id).max || 0) + 1
      students << student
    end
    return students
  end

  # Запись всех значений в файл
  def write_to_file(file_path, students)
    File.open(file_path, 'w') do |file|
      students.each do |student|
        file.puts(student.to_s) 
      end
    end
  end

end

