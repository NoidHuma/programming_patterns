require 'fox16'
require_relative 'view/StudentsListView.rb'

include Fox
class App < FXMainWindow
    def initialize(app)
        super(app, "Students", width: 1024, height: 768)
        tabs = FXTabBook.new(self, opts: LAYOUT_FILL)
        FXTabItem.new(tabs, "Список студентов")
        student_list = FXVerticalFrame.new(tabs, opts: LAYOUT_FILL)
        StudentsListView.new(student_list)
        FXTabItem.new(tabs, "Пока неизвестная вкладка")
        FXVerticalFrame.new(tabs, opts: LAYOUT_FILL)
        FXTabItem.new(tabs, "Тоже пока не понятно что тут")
        FXVerticalFrame.new(tabs, opts: LAYOUT_FILL)
    end
    def create
        super
        show(PLACEMENT_SCREEN)
    end
    def students_list_view(parent)
        FXLabel.new(parent, "Тут будет список студентов")
    end
end