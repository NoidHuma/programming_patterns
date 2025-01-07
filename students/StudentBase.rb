require_relative 'StudentValidator'

class StudentBase

	attr_reader :id,:git

	# конструктор
	def initialize(id: nil, git: nil)
		@id = id
		self.git = git
	end

	# есть ли гит и контакт
	def validate?()
		return (has_git?() && has_contact?()) 
	end

	# есть ли гит
    def has_git?()
		return !@git.nil?
	end

	# есть ли контакт
    def has_contact?()
		return !(@phone.nil? && @telegram.nil? && @email.nil? && @contact.nil?)
    end

	# реализация метода to_s
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
	
	#получить какой-то один контакт
	def contact
		if has_contact?
			if @contact
				contacts_output = @contact
			else
				contacts = [
					@phone,
					@telegram,
					@email,
				].select { |value| !value.nil? && !value.empty? }
				contacts_output = contacts[0]
			end
			return contacts_output
		else
			return nil
		end
	end
	
	# получить фамилию и инициалы
	def fullname
		if @fullname
			fullname_output = @fullname
		else
			fullname_output = "#{@surname} #{@name[0]}.#{@patronymic[0]}."
		end
	end
	
	# краткая информация
	def get_info()
		info_string = "Fullname = " + fullname
		if has_contact?
			info_string += ", Contact = " + contact
		end
		if has_git?
			info_string += ", Git = " + git
		end
		return info_string
	end
  
end
