require_relative 'data_list_student_short.rb'
require_relative 'student.rb'
require_relative 'student_short.rb'
require_relative 'students_list_YAML.rb'
require_relative 'students_list_JSON.rb'

class StudentsList
	protected attr_accessor :format_strategy
	protected attr_writer :students_array

	def initialize(format_strategy)
		self.format_strategy = format_strategy
	end

	def read(file_path)
		self.students_array = self.format_strategy.read(file_path)
	end

	def write(file_path)
		self.format_strategy.write(file_path, students_array)
	end

	def students_array()
		@students_array.dup()
	end

	def get_student_by_id(id)
		students_array.each do |student|
			if student.id == id
				return student
			end
			raise ArgumentError, "id указан неверно!"
		end
	end

	def get_k_n_student_short_list(k, n, data_list = nil)
		start = (k - 1) * n
		selected = []
		if students_array[start, n]
			selected = students_array[start, n]
		end
		selected = selected.map { |student| StudentShort.new(student: student) }
		if data_list.nil?
			data_list = DataListStudentShort.new(selected)
		else
			data_list.list = selected
		end

		data_list
	end

    def sort_by_fio!
        @students_array.sort_by! { |student| student.get_fio }
    end

	def add_student(student)
		if students_array.nil?
			max_id = 0
		else
			max_id = students_array.map{|student| student.id}.max
		end
		student.id = max_id + 1
		
		if !(@students_array.find{ |student_from_array| student_from_array == student })
			@students_array << student
		else
			raise "Запрещено добавление студентов с одинаковыми полями контактов и гит!"
		end
	end

	def replace_student_by_id(id, new_student)
		index = students_array.find_index { |student| student.id == id }
		unless index
			raise IndexError, 'Неверно задан id студента!'
		end
		new_student.id = id
		@students_array[index] = new_student
	end

	def delete_student_by_id(id)
		@students_array.reject! { |student| student.id == id }
	end

	def get_student_short_count()
		students_array.count
	end

end