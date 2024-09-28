class Student

	# аксессор
	attr_reader :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

	# конструктор
	def initialize(id:, surname:, name:, patronymic:, phone: nil, telegram: nil, email: nil, git: nil)
		self.id = id
		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		self.phone = phone
		self.telegram = telegram
		self.email = email
		self.git = git
	end
	
	# Новый конструктор, принимающий строку
	def self.initialize_from_string(input_string)
	    raise ArgumentError, "Входная строка не должна быть пустой" if input_string.nil? || input_string.strip.empty?
		# Парсим строку
		params = {}
		input_string.split(', ').each do |pair|
			key_value = pair.split(': ')
			raise ArgumentError, "Некорректный формат пары Поле-Значение #{pair}" if key_value.length != 2
			key, value = key_value
			params[key.to_sym] = value
		end

    # Вызываем стандартный конструктор с распарсенными параметрами
		new(
			id: params[:id],
			surname: params[:surname],
			name: params[:name],
			patronymic: params[:patronymic],
			phone: params[:phone],
			telegram: params[:telegram],
			email: params[:email],
			git: params[:git]
		)
	end

	# Делаем to_s для этого класса
	def to_s
		student_str = "ID: #{@id}\nName: #{@name}\nSurname: #{@surname}\nPatronymic: #{@patronymic}\nPhone: #{@phone}\nTelegram: #{@telegram}\nEmail: #{@email}\nGit: #{@git}\n"
	end
	
	# Сеттер для изменения id
	def id=(id)
		if id.nil? 
			raise ArgumentError, "ID - обязательное поле"
		else
			@id = id
		end
	end
	
	# Проверка корректности формата строки с фамилией/именем/отчеством
	def self.valid_name?(name)
		name =~ /^[а-яА-ЯёЁa-zA-Z]+$/
	end
	
	# Сеттер для изменения фамилии
	def surname=(surname)
		if surname.nil? 
			raise ArgumentError, "Фамилия - обязательное поле"
		end
		if self.class.valid_name?(surname)
			@surname = surname
		else
			raise ArgumentError, "Некорректный формат фамилии"
		end
	end
	
	# Сеттер для изменения имени
	def name=(name)
		if name.nil? 
			raise ArgumentError, "Имя - обязательное поле"
		end
		if self.class.valid_name?(name)
			@name = name
		else
			raise ArgumentError, "Некорректный формат имени"
		end
	end
	
	# Сеттер для изменения отчества
	def patronymic=(patronymic)
		if patronymic.nil? 
			raise ArgumentError, "Отчество - обязательное поле"
		end
		if self.class.valid_name?(patronymic)
			@patronymic = patronymic
		else
			raise ArgumentError, "Некорректный формат отчества"
		end
	end
	
	# Проверка корректности формата строки с телефоном
	def self.valid_phone?(phone)
		phone =~ /^(?:\+7|8)\d{10}$/
	end
	
	# Сеттер для изменения телефона
	private def phone=(phone)
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
	
	# Сеттер для изменения телеграма
	private def telegram=(telegram)
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
	
	# Сеттер для изменения email
	private def email=(email)
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
	
	# Сеттер для изменения git
	private def git=(git)
		if git.nil? || self.class.valid_git?(git)
			@git = git
		else
			raise ArgumentError, "Некорректный формат ссылки на github"
		end
	end
	
	# проверка наличия гит
	def is_git?
		!@git.nil?
	end
	
	# проверка наличия хотя бы одного контакта
	def is_contacts?
		!(@phone.nil? && @telegram.nil? && @email.nil?)
	end
	
	# метод для изменения полей контактов
	def set_contacts(phone: nil, telegram: nil, email: nil, git: nil)
		self.phone = phone if !phone.nil? 
		self.telegram = telegram if !telegram.nil? 
		self.email = email if !email.nil? 
		self.git = git if !git.nil? 
	end
	
	# получить фамилию и инициалы
	def get_fullname()
		fullname = "#{@surname} #{@name[0]}.#{@patronymic[0]}."
	end
	
	# получить git
	def get_git()
		if is_git?
			return "#{@git}"
		else
			raise ArgumentError, "Git не указан"
		end
	end
	
	# получить контакт
	def get_contact()
		if is_contacts?
			contacts = [
			["phone -", @phone],
			["telegram -", @telegram],
			["email -", @email]
		].select { |_, value| !value.nil? && !value.empty? }
		contacts_output = contacts[0].join(" ")
		return contacts_output
		else
			raise ArgumentError, "Контакты не указаны"
		end
	end	
	
	# краткая информация
	def get_info()
		info_string = get_fullname
		if is_contacts?
			info_string += ", " + get_contact
		else
			info_string += ", contacts are not specified"
		end
		if is_git?
			info_string += ", " + get_git
		else
			info_string += ", Git is not specified"
		end
		return info_string
	end
	
end