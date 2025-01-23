require_relative '../students_list.rb'
require_relative '../data_list_student_short.rb'

class StudentListController
	def initialize(view)
		self.view = view
		self.student_list = StudentsList.new(StudentsListJSON.new)
	    self.student_list.read("students_JSON.txt")
		self.data_list = DataListStudentShort.new([])
		self.data_list.add_observer(self.view)
	end

    def sort_by_column!(index)
        case index
        when 1
            self.student_list.sort_by_fio!
        end
    end

	def refresh_data()
		self.student_list.get_k_n_student_short_list(self.view.current_page_label, self.view.class::ROWS_PER_PAGE, self.data_list)
		self.data_list.count = self.student_list.get_student_short_count
		self.data_list.notify
	end
	
	def add()
	
	end

	def update()
		refresh_data
	end

	def delete(indexes)
		puts "Удаление записей с индексами #{indexes}"
	end

	def edit(index)
		puts "Изменение записи с индексом: #{index}"
	end

	private
	attr_accessor :view, :student_list, :data_list

end