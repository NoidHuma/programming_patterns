class Student

	# аксессор
	attr_accessor :id
	attr_reader :surname, :name, :patronymic, :phone, :telegram, :email, :git

	# конструктор
	def initialize(id:, surname:, name:, patronymic:, phone: nil, telegram: nil, email: nil, git: nil)
		@id = id
		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		self.phone = phone
		self.telegram = telegram
		self.email = email
		self.git = git
	end

	# Делаем to_s для этого класса
	def to_s
		student_str = "ID: " + @id.to_s + "\nSurname: " + @surname.to_s + "\nName: " + @name.to_s + "\nPatronymic: " + @patronymic.to_s + "\nPhone: " + @phone.to_s + "\nTelegram: " + @telegram.to_s + "\nEmail: " + @email.to_s + "\nGit: " + @git.to_s
	end
	
	# Проверка корректности формата строки с фамилией/именем/отчеством
	def self.valid_name?(name)
		name =~ /^[а-яА-ЯёЁa-zA-Z]+$/
	end
	
	# Геттер для изменения фамилии
	def surname=(surname)
		if surname.nil? || self.class.valid_name?(surname)
			@surname = surname
		else
			raise ArgumentError, "Некорректный формат фамилии"
		end
	end
	
	# Геттер для изменения имени
	def name=(name)
		if name.nil? || self.class.valid_name?(name)
			@name = name
		else
			raise ArgumentError, "Некорректный формат имени"
		end
	end
	
	# Геттер для изменения отчества
	def patronymic=(patronymic)
		if patronymic.nil? || self.class.valid_name?(patronymic)
			@patronymic = patronymic
		else
			raise ArgumentError, "Некорректный формат отчества"
		end
	end
	
	# Проверка корректности формата строки с телефоном
	def self.valid_phone?(phone)
		phone =~ /^(?:\+7|8)\d{10}$/
	end
	
	# Геттер для изменения телефона
	def phone=(phone)
		if phone.nil? || self.class.valid_phone?(phone)
			@phone = phone
		else
			raise ArgumentError, "Некорректный формат телефонного номера"
		end
	end
	
	# Проверка корректности формата строки с телеграмом
	def self.valid_telegram?(telegram)
		telegram =~ /^(https:\/\/)?t\.me\/[a-zA-Z0-9_]{5,32}$/
	end
	
	# Геттер для изменения телеграма
	def telegram=(telegram)
		if telegram.nil? || self.class.valid_telegram?(telegram)
			@telegram = telegram
		else
			raise ArgumentError, "Некорректный формат ссылки на телеграм-аккаунт"
		end
	end
  
	# Проверка корректности формата строки с email
	def self.valid_email?(email)
		email =~ /^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$/
	end
	
	# Геттер для изменения email
	def email=(email)
		if email.nil? || self.class.valid_email?(email)
			@email = email
		else
			raise ArgumentError, "Некорректный формат email"
		end
	end
	
	# Проверка корректности формата строки с git
	def self.valid_git?(git)
		git =~ /^(https:\/\/)?github\.com\/[a-zA-Z0-9_-]{1,39}$/
	end
	
	# Геттер для изменения git
	def git=(git)
		if git.nil? || self.class.valid_git?(git)
			@git = git
		else
			raise ArgumentError, "Некорректный формат ссылки на github"
		end
	end
end