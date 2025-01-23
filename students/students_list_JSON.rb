require_relative 'students_list.rb'
require_relative 'students_list_strategy.rb'
require 'json'

class StudentsListJSON < StudentsListStrategy

    def read(file_path)
        unless File.exist?(file_path)
            raise "Файл не найден!" 
        end

        JSON.parse(File.read(file_path), symbolize_names: true).map { |data| Student.new(**data) }
    end

    def write(file_path, students_array)
        to_data_hash = students_array.map{|student| student.to_h}
        json_data = JSON.pretty_generate(to_data_hash)
        File.write(file_path, json_data)
    end

end
