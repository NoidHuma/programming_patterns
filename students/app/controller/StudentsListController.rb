require_relative '../../data_models/data_list/DataList.rb'
require_relative '../../data_models/data_list/DataListStudent.rb'
require_relative '../../data_models/student_lists/StudentsList.rb'
require_relative '../../data_models/student_lists/StudentsListJson.rb'
require_relative '../../data_models/student_lists/StudentsListYaml.rb'

class StudentsListController

def initialize(view)
    self.view = view
    self.student_list = StudentsList.new("../../files/students_list.json", StudentsListJson.new)
    self.data_list = DataListStudentShort.new([])
    self.data_list.add_observer(self.view)
end


def sort_table_by_column
    self.student_list.sort_by_full_name!
    self.data_list.notify(self.data)
end
def refresh_data
    self.student_list.load_students("C:/Users/LesunVo/Desktop/Design-Patterns/students/resources/students.json")
    puts "Loaded students: #{self.student_list.instance_variable_get(:@students).inspect}"
    
    self.data = self.student_list.get_k_n_student_short_list(self.view.current_page_label, self.view.class::ROWS_PER_PAGE)
    puts "Data for current page: #{self.data.inspect}"

    self.data_list.count = self.student_list.get_student_short_count
    puts "Total student count: #{self.data_list.count}"

    self.data_list.notify(self.data)
  end

def add

end


def delete(indexes)
     puts "Удаление записей с индексами #{indexes}"
end


def update(index)
    puts "Изменение записи с индексом: #{index}"
end

private
attr_accessor :view, :student_list, :data_list, :data
       
end