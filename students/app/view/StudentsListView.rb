require 'fox16'
require 'pg'

require_relative '../../data_models/data_list/DataList.rb'
require_relative '../../data_models/data_list/DataListStudent.rb'
require_relative '../../data_models/student_lists/StudentsList.rb'
require_relative '../../database/StudentsListDB.rb'
require_relative '../../data_models/student_lists/StudentsListJson.rb'
require_relative '../../data_models/student_lists/StudentsListYaml.rb'

include Fox

class StudentsListView < FXVerticalFrame

  ROWS_PER_PAGE = 5

  
  def initialize(parent)
    super(parent, opts: LAYOUT_FILL)

    setup_filtering_area
    setup_table_area
  end


  def setup_filtering_area
    filtering_area = FXVerticalFrame.new(self, opts: LAYOUT_FILL_X | LAYOUT_SIDE_TOP)
    FXLabel.new(filtering_area, "Фильтрация")

    FXHorizontalFrame.new(filtering_area, opts: LAYOUT_FILL_X) do |frame|
      FXLabel.new(frame, "Фамилия и инициалы:")
      FXTextField.new(frame, 20, opts: TEXTFIELD_NORMAL)
    end

    add_filtering_row(filtering_area, "Git:")
    add_filtering_row(filtering_area, "Email:")
    add_filtering_row(filtering_area, "Телефон:")
    add_filtering_row(filtering_area, "Telegram:")
  end


  def add_filtering_row(parent, label)
    FXHorizontalFrame.new(parent, opts: LAYOUT_FILL_X) do |frame|
      FXLabel.new(frame, label)
      combo_box = FXComboBox.new(frame, 3, opts: COMBOBOX_STATIC | FRAME_SUNKEN)

      combo_box.numVisible = 3
      combo_box.appendItem("Не важно")
      combo_box.appendItem("Да")
      combo_box.appendItem("Нет")

      text_field = FXTextField.new(frame, 15, opts: TEXTFIELD_NORMAL)
      text_field.enabled = false

      combo_box.connect(SEL_COMMAND) do
        text_field.enabled = (combo_box.currentItem == 1)
      end
    end
  end


  def setup_table_area

    table_area = FXVerticalFrame.new(self, opts: LAYOUT_FILL)
    self.table = FXTable.new(table_area, opts: LAYOUT_FILL | TABLE_READONLY | TABLE_COL_SIZABLE)
    self.table.setTableSize(ROWS_PER_PAGE, 6)
    self.table.rowHeaderMode = LAYOUT_FIX_WIDTH
    self.table.rowHeaderWidth = 30

    controls = FXHorizontalFrame.new(table_area, opts: LAYOUT_FILL_X)
    self.prev_button = FXButton.new(controls, "<<<", opts: BUTTON_NORMAL | LAYOUT_LEFT)
    self.current_page_label = FXLabel.new(controls, "Страница: 1/1", opts: LAYOUT_CENTER_X)
    self.next_button = FXButton.new(controls, ">>>", opts: BUTTON_NORMAL | LAYOUT_RIGHT)

    self.prev_button.connect(SEL_COMMAND) { switch_page(-1) }
    self.next_button.connect(SEL_COMMAND) { switch_page(1) }

    self.table.columnHeader.connect(SEL_COMMAND) do |_, _, column_index|
      sort_table_by_column(column_index)

    end

    populate_table

  end

  private
  
  attr_accessor :table, :data, :total_pages, :current_page, :current_page_label, :prev_button, :next_button, :sort_order

  def populate_table

    data_list = DataListStudent.new([
      Student.new(name: "Faffdsf", surname: "Fvfdfd", lastname: "Edsfs", git: "test1", id: 0, telegram: "@testtt1", birth_date: "01.01.1995", mail: "wysi727@gmail.com", phone: "88005553535"),
      Student.new(name: "Frete", surname: "Gfdgfd", lastname: "Mfgfd", git: "test2", id: 1, telegram: "@testtt2", birth_date: "02.01.1995", mail: "wysi728@gmail.com", phone: "88005553536"),
      Student.new(name: "Vfdf", surname: "Tretreg", lastname: "Thgfbgf", git: "test3", id: 1, telegram: "@testtt3", birth_date: "03.01.1995", mail: "wysi729@gmail.com", phone: "88005553537"),
    ])

    self.data = data_list.get_table
    self.total_pages = ((self.data.row_count - 1).to_f / ROWS_PER_PAGE).ceil
    self.current_page = 1
    update_table

  end


  def update_table(sorted_data = nil)

    return if self.data.nil? || self.data.row_count <= 1
    (0...self.data.column_count).each do |col_index|
      self.table.setColumnText(col_index, self.data.get_element_at(0, col_index).to_s)
    end

    clear_table

    data_to_display = sorted_data || get_page_data(self.current_page)
    data_to_display.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        self.table.setItemText(row_index, col_index, cell.to_s)
      end

    end
    self.current_page_label.text = "Страница: #{self.current_page}/#{self.total_pages}"

  end

  def clear_table
    (0...ROWS_PER_PAGE).each do |row_index|
      (0...self.data.column_count).each do |col_index|
        self.table.setItemText(row_index, col_index, "")
      end
    end

  end

  def get_page_data(page_number)
    start_index = (page_number - 1) * ROWS_PER_PAGE + 1
    end_index = start_index + ROWS_PER_PAGE - 1
    data_page = []

    (start_index..end_index).each do |row_index|
      break if row_index >= self.data.row_count
      row = []
      (0...self.data.column_count).each do |col_index|
        row << self.data.get_element_at(row_index, col_index)
      end
      data_page << row
    end

    data_page

  end

  def switch_page(direction)
    new_page = self.current_page + direction
    return if new_page < 1 || new_page > self.total_pages
    
    self.current_page = new_page
    update_table
  end

  def sort_table_by_column(column_index)
    return if self.data.nil? || self.data.row_count <= 1
  
    headers = (0...self.data.column_count).map { |col_index| self.data.get_element_at(0, col_index) }
    rows = (1...self.data.row_count).map do |row_index|
      (0...self.data.column_count).map { |col_index| self.data.get_element_at(row_index, col_index) }
    end
  
    self.sort_order ||= {}
    self.sort_order[column_index] = !self.sort_order.fetch(column_index, false)

    sorted_rows = rows.sort_by do |row|
      value = row[column_index]
      if value.nil?
        ''
      else
        value.to_s
      end
    end
    sorted_rows.reverse! unless self.sort_order[column_index]
    all_rows = [headers] + sorted_rows
    self.data = DataTable.new(all_rows)
    update_table

  end
  
end