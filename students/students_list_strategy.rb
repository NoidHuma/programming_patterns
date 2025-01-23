require_relative 'students_list.rb'

class StudentsListStrategy
	def read(file_path)
		raise NotImplementedError, "Метод read должен быть реализован!"
	end

	def write(file_path, students_array)
		raise NotImplementedError, "Метод write должен быть реализован!"
	end

end