require 'pg'

class Connection

	private_class_method :new
	@@instance = nil
	def self.instance
		@@instance ||= new
	end
	
	def initialize()
		@connection = PG.connect(
      dbname: "student",
      user: "postgres",
      password: "",
      host:"localhost",
      port: 5432
    )
	end

	def execute_query(query, params=[])
	  @connection.exec_params(query, params)
	end

	def close
	  @connection.close
	end
end