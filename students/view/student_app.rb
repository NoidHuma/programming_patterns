require 'fox16'
require_relative 'student_list_view.rb'
include Fox

class StudentApp < FXMainWindow
    def initialize(app)
        super(app, "Students", width: 1024, height: 768)

        tabs = FXTabBook.new(self, opts: LAYOUT_FILL)
        FXTabItem.new(tabs, "Список студентов")
        
        student_list = FXVerticalFrame.new(tabs, opts: LAYOUT_FILL)
        StudentListView.new(student_list)

        FXTabItem.new(tabs, "Пустая вкладка")
        second_tab = FXVerticalFrame.new(tabs, LAYOUT_FILL)
        
        FXTabItem.new(tabs, "Пустая вкладка")
        third_tab = FXVerticalFrame.new(tabs)

        FXVerticalFrame.new(tabs, opts: LAYOUT_FILL)
    end
    
    def create
        super
        show(PLACEMENT_SCREEN)
    end

end
