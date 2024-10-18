require_relative 'validator.rb'

class StudentBase

	attr_reader :id,:git
	
	protected

	def initialize(id: nil, git: nil)
		@id = id
		self.git = git
	end

	def validate?()
		return (has_git?() && has_contact?()) 
	end

    def has_git?()
		return !@git.nil?
	end

    def has_contact?()
		return !(@phone.nil? && @telegram.nil? && @email.nil? && @contact.nil?)
    end
	
	def get_info
		raise NotImplementedError, "Метод get_info должен быть реализован"
	end
  
	def to_s
		raise NotImplementedError, "Метод to_s должен быть реализован"
	end
  
end
