class Student

	# конструктор
	def initialize(id:, surname:, name:, patronymic:, phone: nil, telegram: nil, email: nil, git: nil)
		@id = id
		@surname = surname
		@name = name
		@patronymic = patronymic
		@phone = phone
		@telegram = telegram
		@email = email
		@git = git
	end

	# геттер и сеттер для id
	def get_id
		@id
	end
	
	def set_id(id)
		@id = id
	end
	
	# геттер и сеттер для фамилии
	def get_surname
		@surname
	end
	
	def set_surname(surname)
		@surname = surname
	end
	
	# геттер и сеттер для имени
	def get_name
		@name
	end
	
	def set_name(name)
		@name = name
	end
	
	# геттер и сеттер для отчества
	def get_patronymic
		@patronymic
	end
	
	def set_patronymic(patronymic)
		@patronymic = patronymic
	end
	
	# геттер и сеттер для телефона
	def get_phone
		@phone
	end
	
	def set_phone(phone)
		@phone = phone
	end
	
	# геттер и сеттер для телеграма
	def get_telegram
		@telegram
	end
	
	def set_telegram(telegram)
		@telegram = telegram
	end
	
	# геттер и сеттер для почты
	def get_email
		@email
	end
	
	def set_email(email)
		@email = email
	end
	
	# геттер и сеттер для гит
	def get_git
		@git
	end
	
	def set_git(git)
		@git = git
	end

	# Делаем to_s для этого класса
	def to_s
		student_str = "ID: " + @id.to_s + "\nSurname: " + @surname.to_s + "\nName: " + @name.to_s + "\nPatronymic: " + @patronymic.to_s + "\nPhone: " + @phone.to_s + "\nTelegram: " + @telegram.to_s + "\nEmail: " + @email.to_s + "\nGit: " + @git.to_s
	end
end