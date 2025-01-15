require 'pg'

class Connection
	
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
	  @connection.close if @connection
	end
end