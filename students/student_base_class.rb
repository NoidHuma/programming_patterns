require_relative 'validator.rb'

class StudentBase

	attr_reader :id,:git

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
	
end
