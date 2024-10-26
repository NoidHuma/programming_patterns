class StudentValidator

	NAME_REGEX = /^[а-яА-ЯёЁa-zA-Z]+$/
	FULLNAME_REGEX = /^[А-ЯЁA-Z][а-яёa-z-]*\s[А-ЯЁA-Z]\.[А-ЯЁA-Z]\.$/
	PHONE_REGEX = /^(?:\+7|8)\d{10}$/
	TELEGRAM_REGEX = /^(https:\/\/)?t\.me\/[a-zA-Z0-9_]{5,32}$/
	EMAIL_REGEX = /^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$/
	GIT_REGEX = /^(https:\/\/)?github\.com\/[a-zA-Z0-9_-]{1,39}$/
	

	# Проверка корректности формата строки с фамилией/именем/отчеством
	def self.valid_name?(name)
		name =~ NAME_REGEX
	end
	
	# Проверка корректности формата строки с телефоном	
	def self.valid_phone?(phone)
		phone =~ PHONE_REGEX
	end
	
	# Проверка корректности формата строки с телеграмом
	def self.valid_telegram?(telegram)
		telegram =~ TELEGRAM_REGEX
	end
	
	# Проверка корректности формата строки с email
	def self.valid_email?(email)
		email =~ EMAIL_REGEX
	end
		
	# Проверка корректности формата строки с git
	def self.valid_git?(git)
		git =~ GIT_REGEX
	end

	# Проверка корректности формата строки с фамилией и инициалами
	def self.valid_fullname?(fullname)
		fullname =~ FULLNAME_REGEX
	end
	
end
