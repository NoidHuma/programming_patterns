require_relative 'StudentBase.rb'

class Student < StudentBase

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

	# Делаем to_s для этого класса

	
	# Сеттер для изменения фамилии
	def surname=(surname)
		if surname.nil? 
			raise ArgumentError, "Фамилия - обязательное поле"
		end
		if StudentValidator.valid_name?(surname)
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
		if StudentValidator.valid_name?(name)
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
		if StudentValidator.valid_name?(patronymic)
			@patronymic = patronymic
		else
			raise ArgumentError, "Некорректный формат отчества"
		end
	end
	
	# Сеттер для изменения телефона
	private def phone=(phone)
		if phone.nil? || StudentValidator.valid_phone?(phone)
			@phone = phone
		else
			raise ArgumentError, "Некорректный формат телефонного номера"
		end
	end
	
	# Сеттер для изменения телеграма
	private def telegram=(telegram)
		if telegram.nil? || StudentValidator.valid_telegram?(telegram)
			@telegram = telegram
		else
			raise ArgumentError, "Некорректный формат ссылки на телеграм-аккаунт"
		end
	end
	
	# Сеттер для изменения email
	private def email=(email)
		if email.nil? || StudentValidator.valid_email?(email)
			@email = email
		else
			raise ArgumentError, "Некорректный формат email"
		end
	end
	
	# Сеттер для изменения git
	def git=(git)
		if git.nil? || StudentValidator.valid_git?(git)
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
	
<<<<<<< HEAD:students/student_class.rb
end
=======
	# получить фамилию и инициалы
	def get_fullname()
		fullname = "#{@surname} #{@name[0]}.#{@patronymic[0]}."
	end
	
	# получить git
	def git
		if has_git?
			return "#{@git}"
		else
			return "Git is not specified"
		end
	end
	
	# получить контакт
	def get_contact()
		if has_contact?
			contacts = [
			@phone,
			@telegram,
			@email,
		].select { |value| !value.nil? && !value.empty? }
		contacts_output = contacts[0]
		return contacts_output
		else
			return "Contacts are not specified"
		end
	end	
	
	# краткая информация
	def get_info()
		info_string = "Fullname = " + get_fullname
		if has_contact?
			info_string += ", Contact = " + get_contact
		end
		if has_git?
			info_string += ", Git = " + git
		end
		return info_string
	end
	
end
>>>>>>> 2e4079e505057182f4c812ed7189c9a6dc874176:students/Student.rb
