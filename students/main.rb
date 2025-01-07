STDOUT.sync = true

require_relative 'Student.rb'
require_relative 'StudentShort.rb'

student_1 = Student.new(id: 1, surname: "Grigorenko", name: "Nikita", patronymic: "Alekseevich", phone: "+79649201760", telegram: "https://t.me/noidhuma", email: "nikitag.big2005@gmail.com", git: "https://github.com/NoidHuma")

student_2 = Student.initialize_from_string("id: 2, surname: Bachurin, name: Vano, patronymic: Alekseevich, telegram: https://t.me/bigbingo")

student_3 = StudentShort.initialize_from_student(student: student_1)

student_4 = StudentShort.new(id: student_2.id, student_info: student_2.get_info)

student_2.git = "https://github.com/bigcodebingo"

puts student_1
puts ""
puts student_2
puts ""
puts student_3.get_info
puts ""
puts student_4
puts ""



