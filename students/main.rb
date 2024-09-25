STDOUT.sync = true

load 'student_class.rb'

student_1 = Student.new(id: 1, surname: "Grigorenko", name: "Nikita", patronymic: "Alekseevich", phone: "+79649201760", telegram: "@noidhuma", email: "nikitag.big2005@gmail.com", git: "https://github.com/NoidHuma")

student_2 = Student.new(id: 2, surname: "Bachurin", name: "Vano", patronymic: "Alekseevich", telegram: "@bigbingo")

puts student_1
puts ""
puts student_2

