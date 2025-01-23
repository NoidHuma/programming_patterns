require 'pg'

class ConnectionDB
	private_class_method :new
	private attr_accessor :connection
	@@instance = nil

	def self.instance
		@@instance ||= new
	end

	def initialize()
		self.connection = PG.connect(
			dbname: 'Students_Ruby',
			user: "postgres",
			password: "s170327",
			host:"localhost",
			port:5432
		)
	end

	def query(query, params=[])
		self.connection.exec_params(query, params)
	end
    
	def close()
		self.connection.close
		@@instance = nil
	end

end
