class Singleton
	private_class_method :new

	def initialize
		@some_data = "Некоторые данные"
	end

	def self.instance
		@instance ||= new
	end

	def some_method
		puts "Вызван метод some_method, данные: #{@some_data}"
	end
end

singleton1 = Singleton.instance
singleton2 = Singleton.instance

singleton1.some_method
p singleton1.object_id == singleton2.object_id