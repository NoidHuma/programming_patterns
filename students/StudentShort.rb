require_relative 'StudentBase.rb'

class StudentShort < StudentBase
  
	# конструктор, параметр либо объект экземпляр класса student, либо id и строка с краткой информацией
	def self.initialize_from_student(student:)
		new(id: student.id, student_info: student.get_info)
	end
  
	def initialize(id:, student_info:)
		@id = id
		info = student_info.split(", ").map do |part|
			piece = part.split("=")
			case piece[0].strip
			when "Fullname"
				@fullname = piece[1].strip
			when "Contact"
				@contact = piece[1].strip
			when "Git"
				@git = piece[1].strip
			else
				raise ArgumentError, "Неверный формат строки"
			end
		end
	end
	
end

