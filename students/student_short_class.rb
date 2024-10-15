require_relative 'student_class.rb'

class Student_short

	attr_reader :id, :fullname, :contact, :git
  
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
  
	def parse_student_info(student_info)
		info = student_info.split(", ")
		@fullname = info[0]
		@contact = info[1]
		@git = info[2]
	end
	
	def to_s
		student_str = "ID: #{@id}\nFull name: #{@fullname}\nContact: #{@contact}\nGit: #{@git}\n"
	end
	
end