require_relative 'StudentBase.rb'

class Student < StudentBase
	include StudentValidator

	# аксессор
	attr_reader :surname, :name, :patronymic, :phone, :telegram, :email

	# конструктор
	def initialize(id: nil, surname:, name:, patronymic:, phone: nil, telegram: nil, email: nil, git: nil)
		super(id:id, git:git)
		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		set_contacts(phone: phone, telegram: telegram, email: email) 
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

	#конструктор принимающий хеш
	def self.initialize_from_hash(params)
		raise ArgumentError, "Входной хеш не должен быть пустым" if params.nil? || !params.is_a?(Hash) || params.empty?
	
		# Вызываем стандартный конструктор с переданными параметрами
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
	
	def ==(student)
    self.github == student.github || self.phone == student.phone || self.email == student.email || self.telegram == student.telegram
  end
	
	# Сеттер для изменения фамилии
	def surname=(surname)
		if surname.nil? 
			raise ArgumentError, "Фамилия - обязательное поле"
		end
		if valid_name?(surname)
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
		if valid_name?(name)
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
		if valid_name?(patronymic)
			@patronymic = patronymic
		else
			raise ArgumentError, "Некорректный формат отчества"
		end
	end
	
	# Сеттер для изменения телефона
	private def phone=(phone)
		if phone.nil? || valid_phone?(phone)
			@phone = phone
		else
			raise ArgumentError, "Некорректный формат телефонного номера"
		end
	end
	
	# Сеттер для изменения телеграма
	private def telegram=(telegram)
		if telegram.nil? || valid_telegram?(telegram)
			@telegram = telegram
		else
			raise ArgumentError, "Некорректный формат ссылки на телеграм-аккаунт"
		end
	end
	
	# Сеттер для изменения email
	private def email=(email)
		if email.nil? || valid_email?(email)
			@email = email
		else
			raise ArgumentError, "Некорректный формат email"
		end
	end
	
	# Сеттер для изменения git
	def git=(git)
		if git.nil? || valid_git?(git)
			@git = git
		else
			raise ArgumentError, "Некорректный формат ссылки на github"
		end
	end
	
	# метод для изменения полей контактов
	def set_contacts(phone: nil, telegram: nil, email: nil)
		self.phone = phone if !phone.nil?
		self.telegram = telegram if !telegram.nil?
		self.email = email if !email.nil?
	end
end
