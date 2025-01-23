require 'pg'
require_relative 'student.rb'
require_relative 'student_short.rb'
require_relative 'connection_db.rb'

class StudentsListDB
	private attr_accessor :connection

	def initialize()
		self.connection = ConnectionDB.new()
	end

	def get_student_by_id(id)
		result = connection.query("SELECT * FROM student WHERE id = $1", [id])
        if result.ntuples == 0
            raise "Студент с ID #{id} не найден!"
        end
        Student.new_from_hash(result[0])
	end

	def get_k_n_student_short_list(k, n, data_list = nil)
		start = (k - 1) * n
		selected = connection.query("SELECT * FROM student LIMIT $1 OFFSET $2", [n, start])
		selected = selected.map do |row| 
			student = Student.new_from_hash(row) 
			StudentShort.new(student: student) 
		end
		if data_list.nil?
			data_list = DataListStudentShort.new(selected)
		end

		data_list
	end

	def add_student(student)
		if !(get_data_from_db.find{ |student_from_db| student_from_db == student })
			result = connection.query(
				"INSERT INTO student (surname, name, patronymic, git, email, tg, phone) 
				VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id",
				[
					student.surname, student.name, student.patronymic, student.git, student.email,
					student.tg, student.phone
				]
				)
		else
			raise "Запрещено добавление студентов с одинаковыми полями контактов и гит!"
		end
	end

	def replace_student_by_id(id, new_student)
		result = connection.query(
			"UPDATE student SET surname = $1, name = $2, patronymic = $3, git = $4, email = $5, 
			tg = $6, phone = $7 WHERE id = $8",
	        [
	        	new_student.surname, new_student.name, new_student.patronymic, new_student.git, 
	            new_student.email, new_student.tg, new_student.phone, id
	        ]
	        )
		if result.cmd_tuples == 0
        	raise "Студент с ID #{id} не найден!" 
        end
	end

	def delete_student_by_id(id)
		result = connection.query("DELETE FROM student WHERE id = $1", [id])
		if result.cmd_tuples == 0
			raise "Студент с ID #{id} не найден!"
		end 
	end

	def get_student_short_count()
		result = connection.query("SELECT COUNT(*) FROM student")
		result[0]['count'].to_i
	end

	def close()
		connection.close
	end

	private def get_data_from_db()
		query_result = @connection.query("SELECT * FROM student")
		data = []
		query_result.each do |row|
			student_data = Student.new_from_hash(row)
			data.push(student_data)
		end
		return data
	end

end