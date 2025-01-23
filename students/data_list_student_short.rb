require_relative 'data_list.rb'

class DataListStudentShort < DataList
	private
	def get_students_names()
		["number", "full name", "git", "contact"]
	end

	def get_row(obj)
		return [obj.surname_inits, obj.git, obj.contact]
	end

end
