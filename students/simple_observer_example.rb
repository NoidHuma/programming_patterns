class Subject
 	def initialize()
    	@observers = []
 	end

 	def attach(observer)
    	@observers << observer
 	end

 	def detach(observer)
    	@observers.delete(observer)
 	end

 	def notify_observers()
    	@observers.each { |observer| observer.update(self) }
 	end

 	def state=(new_state)
    	@state = new_state
    	notify_observers
 	end

 	def state()
    	@state
 	end
end

class Observer
 	def update(subject)
    	puts "Наблюдатель отреагировал на изменение состояния объекта: #{subject.state}"
 	end
end

subject = Subject.new
observer1 = Observer.new
observer2 = Observer.new

subject.attach(observer1)
subject.attach(observer2)

subject.state = "Состояние 1"
subject.state = "Состояние 2"

subject.detach(observer1)

subject.state = "Состояние 3"