require_relative 'student_base_class.rb'

class StudentShort < StudentBase

	attr_reader :fullname, :contact
  
	# конструктор, параметр либо объект экземпляр класса student, либо id и строка с краткой информацией
	def initialize(student: nil, id: nil, student_info: nil)
		if student
			@id = student.id
			parse_student_info(student.get_info)
		elsif id && student_info
			@id = id
			parse_student_info(student_info)
		end
	end
  
	private def parse_student_info(student_info)
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
	
	def get_info()
		info_string = "Fullname = " + @fullname
		if has_contact?
			info_string += ", Contact = " + @contact
		end
		if has_git?
			info_string += ", Git = " + @git
		end
		return info_string
	end
	

	
end

