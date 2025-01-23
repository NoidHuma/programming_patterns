class MainStudent
	attr_reader :id, :surname_inits, :git, :contact, :phone, :tg, :email

	def initialize(id: nil, git: nil)
		self.id = id
		self.git = git 
	end

	def id=(id)
		if (MainStudent.valid_id?(id))
			@id = id
		else
			raise ArgumentError, "Неверный формат id: #{id}"
 		end   
    end

    def git=(git)
		if (MainStudent.valid_git?(git))
			@git = git
		else
			raise ArgumentError, "Неверный формат адреса git: #{git}"
 		end   
    end

    def self.valid_id?(id)
		if !id.nil?
			return id.to_s.match?(/^[0-9]+$/)
		else
			return true
		end
	end

	def self.valid_git?(git)
		if !git.nil?
			return git.match?(/^(https:\/\/)?github.com\/[a-zA-Z0-9_-]+$/)
		else 
			return true
		end
	end

	def get_fio
		@surname_inits = "#{surname} #{name[0]}. #{patronymic[0]}."
		surname_inits
	end

	def get_contact
		if(!self.phone.nil?)
			return "#{self.phone}"
		end
		if(!self.email.nil?)
			return "#{self.email}"
		end
		if(!self.tg.nil?)
			return "#{self.tg}"
		end
	end
	
	def to_s
		str = "surname = #{@surname}, name = #{@name}, patronymic = #{@patronymic}"
		str += ", id = #{@id}" if @id
		str += ", phone = #{@phone}" if @phone
		str += ", tg = #{@tg}" if @tg
		str += ", email = #{@email}" if @email
		str += ", git = #{@git}" if @git
		return str
	end

end