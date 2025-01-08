require 'json'
require_relative '../../Student' # Подразумевается, что класс Student определен в этом файле
require_relative 'interface'

class StudentsListJson < StorageStrategy

  # Чтение всех значений из файла
  def read_from_file(file_path)
    students = []
    return students unless File.exist?(file_path)
    JSON.parse(File.read(file_path), symbolize_names: true).map do |student|
      student = Student.new(**student)
      student.id = (students.map(&:id).max || 0) + 1
      students << student
    end
    return students
  end

  # Запись всех значений в файл
  def write_to_file(file_path, students)
    to_data_hash = students.map{|student| student.to_h}
    json_data = JSON.pretty_generate(to_data_hash)
    File.write(file_path, json_data)
  end

end
