class Student

	# аксессор
	attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

	# конструктор
	def initialize(id:, surname:, name:, patronymic:, phone: nil, telegram: nil, email: nil, git: nil)
		@id = id
		@surname = surname
		@name = name
		@patronymic = patronymic
		self.phone = phone
		@telegram = telegram
		@email = email
		@git = git
	end

	# Делаем to_s для этого класса
	def to_s
		student_str = "ID: " + @id.to_s + "\nSurname: " + @surname.to_s + "\nName: " + @name.to_s + "\nPatronymic: " + @patronymic.to_s + "\nPhone: " + @phone.to_s + "\nTelegram: " + @telegram.to_s + "\nEmail: " + @email.to_s + "\nGit: " + @git.to_s
	end
	
	# Проверка правильности формата строки с телефоном
	def self.valid_phone?(phone)
		phone =~ /^(?:\+7|8)\d{10}$/
	end
	
	# Геттер для изменения телефона
	def phone=(phone)
		if phone.nil? || self.class.valid_phone?(phone)
			@phone = phone
		else
			raise ArgumentError, "Неверный формат телефонного номера"
		end
	end
  
end