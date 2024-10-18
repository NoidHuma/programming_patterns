require_relative 'validator.rb'

class StudentBase

	attr_reader :id,:git

	def initialize(id: nil, git: nil)
		@id = id
		self.git = git
	end

	def validate?()
		return (has_git?() && has_contact?()) 
	end

    def has_git?()
		return !@git.nil?
	end

    def has_contact?()
		return !(@phone.nil? && @telegram.nil? && @email.nil? && @contact.nil?)
    end
	
	def get_info
		raise NotImplementedError, "Метод get_info должен быть реализован"
	end
  
	def to_s
		student_str = ""
		student_str += "ID = #{@id}\n" if @id
		student_str += "Surname = #{@surname}\n" if @surname
		student_str += "Name = #{@name}\n" if @name
		student_str += "Patronymic = #{@patronymic}\n" if @patronymic
		student_str += "Fullname = #{@fullname}\n" if @fullname
		student_str += "Phone = #{@phone}\n" if @phone
		student_str += "Telegram = #{@telegram}\n" if @telegram
		student_str += "Email = #{@email}\n" if @email
		student_str += "Contact = #{@contact}\n" if @contact
		student_str += "Git = #{@git}\n" if @git
		return student_str
	end
  
end
