require_relative 'main_student.rb'

class StudentShort < MainStudent
	
	def initialize(student:, contact: nil)
		super(id: student.id, git: student.git)
		@surname_inits = "#{student.surname} #{student.name[0]}. #{student.patronymic[0]}."
		@contact = student.tg || student.phone || student.email || contact
	end

	def self.from_str(id, str)

		surname_inits = ""
		git = ""
		contact = ""

		str.split(",").map do |part|
			piece = part.split("=")
			case piece[0].strip
			when "ФИО"
				surname_inits = piece[1].strip
			when "git"
				git = piece[1].strip
			when "phone"
				contact = piece[1].strip
			when "tg"
				contact = piece[1].strip
			when "email"
				contact = piece[1].strip
			else
				raise ArgumentError, "Неверный формат строки."
			end
		end

		surname, name, patronymic = surname_inits.gsub('.', '').split(" ", 3)
		student = Student.new(id: id, surname: surname, name: name, patronymic: patronymic, git: git)
		student_sh = StudentShort.new(student: student, contact: contact)

	end

	def to_s
		str = "id = #{@id}"
		str += ", ФИО = #{@surname_inits}"
		if @git
			str += ", git = #{@git}"
		end
		if @contact
			str += ", контакт = #{@contact}"
		end
		return str
	end
end