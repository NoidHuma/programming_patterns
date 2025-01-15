require_relative 'connection'
require_relative '../Student'

class StudentsListDB
    
    def initialize()
        @connection = Connection.instance
      end
    
    def get_student_by_id(id)
        data = @connection.execute_query("SELECT * FROM student WHERE id = $1", [id])
        if data.ntuples == 0
            raise "студент не существует"
        end
        student = data[0].transform_keys{ |key| key.to_sym }
        Student.initialize_from_hash(**student)
    end

    def get_k_n_student_short_list(k, n)
        start = (k - 1) * n
        data = @connection.execute_query("SELECT * FROM student LIMIT $1 OFFSET $2", [n, start])
        data.map do |row|
            row = row.transform_keys(&:to_sym)
            Student.initialize_from_hash(**row)
        end
    end

    def add_student(student)
        query = "INSERT INTO student (name, surname, patronymic, phone, email, telegram, git) VALUES ($1, $2, $3, $4, $5, $6, $7)"
        params = [student.name, student.surname, student.patronymic, student.phone, student.email, student.telegram, student.git]
        @connection.execute_query(query, params)
    end

    def replace_student_by_id(id, new_student)
        query = "UPDATE student SET name = $1, surname = $2, patronymic = $3, phone = $4, email = $5, telegram = $6, git = $7 WHERE id = $8"
        params = [new_student.name, new_student.surname, new_student.patronymic, new_student.phone, new_student.email, new_student.telegram, new_student.git, id]
		result = @connection.execute_query(query, params)
		if result.cmd_tuples == 0
        	raise "не найден студент с id #{id}" 
        end
	end

    def delete_student_by_id(id)
		result = @connection.execute_query("DELETE FROM student WHERE id = $1", [id])
		if result.cmd_tuples == 0
			raise "не найден студент с id #{id}"
		end 
	end

	def size()
		result = @connection.execute_query("SELECT COUNT(*) FROM student")
		result[0]['count'].to_i
	end

end

