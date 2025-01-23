require_relative 'data_table.rb'

class DataList
	attr_accessor :observers, :count
	attr_reader :list
	protected attr_accessor :selected_elem, :selected_id_arr
	
	def initialize(list)
		self.list = list
		self.selected_id_arr = []
		self.observers = []
	end

	def add_observer(observer)
		self.observers << observer
	end

	def notify()
		self.observers.each do |observer|
			observer.set_table_params(self.get_names, self.count)
			observer.set_table_data(self.get_data)
		end
	end

	def list=(list)
		unless list.is_a?(Array)
			raise ArgumentError, "Параметром должен быть массив!"
		end
	
		@list = list.dup()
	end

	def select(number)
		if number < 0 || number >= list.length
			raise "Номер вне границ массива!" 
		end
		self.selected_elem = list[number]
		self.selected_id_arr << number
	end

	def get_selected()
		self.selected_id_arr.dup()
	end

	# Шаблонный метод
	def get_names()
		get_students_names
	end

	def get_students_names()
		raise NotImplementedError, "Метод get_students_names должен быть реализован в наследниках!"
	end

	# Шаблонный метод
	def get_data()
		table = []
		table.append(get_names)
		self.list.each_with_index do |student, index|
			obj = student
			row = [index + 1].concat(get_row(obj))
			table.append(row)
		end

		DataTable.new(table)
	end
	
	def get_row(obj)
		raise NotImplementedError, "Метод get_row должен быть реализован в наследниках!"
	end

end