require_relative 'students_list.rb'
require_relative 'students_list_strategy.rb'
require 'yaml'

class StudentsListYAML < StudentsListStrategy

	def read(file_path)
		unless File.exist?(file_path)
            raise "Файл не найден!" 
        end

		YAML.load_file(file_path, symbolize_names: true).map{ |data| Student.new(**data) }
	end

	def write(file_path, students_array)
		data = students_array.map { |student| student.to_h }
		File.write(file_path, data.to_yaml)
	end

end
