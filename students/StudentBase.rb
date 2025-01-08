require_relative 'StudentValidator'

class StudentBase

	attr_reader :git
	attr_accessor :id

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
		student_str += "id: #{@id}, " if @id
		student_str += "surname: #{@surname}, " if @surname
		student_str += "name: #{@name}, " if @name
		student_str += "patronymic: #{@patronymic}, " if @patronymic
		student_str += "fullname: #{@fullname}, " if @fullname
		student_str += "phone: #{@phone}, " if @phone
		student_str += "telegram: #{@telegram}, " if @telegram
		student_str += "email: #{@email}, " if @email
		student_str += "contact: #{@contact}, " if @contact
		student_str += "git: #{@git}" if @git
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
