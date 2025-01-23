require_relative 'main_student.rb'

class Student < MainStudent
	attr_reader :name, :surname, :patronymic

	def surname=(surname)
		if (Student.valid_surname?(surname))
			@surname = surname
		else
			raise ArgumentError, "Неверный формат фамилии: #{surname}"
 		end   
    end
    def name=(name)
		if (Student.valid_name?(name))
			@name = name
		else
			raise ArgumentError, "Неверный формат имени: #{name}"
 		end   
    end
    def patronymic=(patronymic)
		if (Student.valid_patronymic?(patronymic))
			@patronymic = patronymic
		else
			raise ArgumentError, "Неверный формат отчества: #{patronymic}"
 		end   
    end
    
    private def phone=(phone)
		if (Student.valid_phone?(phone))
			@phone = phone
		else
			raise ArgumentError, "Неверный формат номера телефона: #{phone}"
 		end   
    end
    private def tg=(tg)
		if (Student.valid_tg?(tg))
			@tg = tg
		else
			raise ArgumentError, "Неверный формат адреса телеграм: #{tg}"
 		end   
    end
    private def email=(email)
		if (Student.valid_email?(email))
			@email = email
		else
			raise ArgumentError, "Неверный формат адреса электронной почты: #{email}"
 		end   
    end

	def initialize(surname:, name:, patronymic:, id: nil, phone: nil, tg: nil, email: nil, git: nil)
		super(id: id, git: git)
   		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		self.set_contacts(phone: phone, tg: tg, email: email)
	end

	def self.new_from_hash(params)
    	params = params.transform_keys{ |key| key.to_sym }
    	new(**params)
	end

	def self.valid_surname?(surname)
		if surname == nil
			return false
		end
		return surname.match?(/^[A-ZА-ЯЁ][a-zа-яё]*$/)
	end

	def self.valid_name?(name)
		if name == nil
			return false
		end
		return name.match?(/^[A-ZА-ЯЁ][a-zа-яё]*$/)
	end

	def self.valid_patronymic?(patronymic)
		if patronymic == nil
			return false
		end
		return patronymic.match?(/^[A-ZА-ЯЁ][a-zа-яё]*$/)
	end

	def self.valid_phone?(phone)
		if !phone.nil?
			return phone.match?(/^\+7\d{10}$/)
		else
			return true
		end

	end

	def self.valid_tg?(tg)
		if !tg.nil?
			return tg.match?(/^\@[a-zA-Z0-9_]{5,32}$/)
		else
			return true
		end
	end

	def self.valid_email?(email)
		if !email.nil?
			return email.match?(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z_-]+$/)
		else
			return true
		end
	end

	def has_git?()
		if self.git == nil
			return false
		end
		return true
	end	

	def has_contact?()
		if self.phone != nil
			return true
		end
		if self.tg != nil
			return true
		end
		if self.email != nil
			return true
		end
		return false
	end	

	def contain?()
		return has_git?() && has_contact?()
	end

	def set_contacts(phone: nil, tg: nil, email: nil)
		if !phone.nil?
			self.phone = phone 
		end
		if !tg.nil?
			self.tg = tg
		end 
		if !email.nil? 
			self.email = email
		end 
	end

	def get_info()
		str = "ФИО = #{get_fio}"
		if @git
			str += ", git = #{git}"
		end
		contact = ""
		if @phone
			contact += ", phone = #{phone}"
			@contact = phone
		elsif @email
			contact += ", email = #{email}"
			@contact = email
		elsif @tg
			contact += ", tg = #{tg}"
			@contact = tg
		end
		str += contact
		return str
	end

	def ==(other)

		if self.git != nil && self.git == other.git
			return true
		end

		if self.phone != nil && self.phone == other.phone
			return true
		end

		if self.email != nil && self.email == other.email
			return true
		end

		if self.tg != nil && self.tg == other.tg
			return true
		end

		return false
	end

	def to_h
		{id: self.id, surname: self.surname, name: self.name, patronymic: self.patronymic, 
		tg: self.tg, email: self.email, phone: self.phone, git: self.git}
	end
end