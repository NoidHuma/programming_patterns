STDOUT.sync = true

require_relative 'student_class.rb'
require_relative 'student_short_class.rb'

student_1 = Student.new(id: 1, surname: "Grigorenko", name: "Nikita", patronymic: "Alekseevich", phone: "+79649201760", telegram: "https://t.me/noidhuma", email: "nikitag.big2005@gmail.com", git: "https://github.com/NoidHuma")

student_2 = Student.initialize_from_string("id: 2, surname: Bachurin, name: Vano, patronymic: Alekseevich, telegram: https://t.me/bigbingo")

student_3 = Student_short.new(student: student_1)

student_4 = Student_short.new(id: student_2.id, student_info: student_2.get_info)


# student_5 = Student.initialize_from_string(" ")

# student_2.git = "https://github.com/bigcodebingo"

puts student_1.git
puts ""
puts student_2.git
puts ""
puts student_3
puts ""
puts student_4
puts ""
# student_1.set_contacts(phone: "+79649201760", telegram: "https://t.me/xexex", git: "https://github.com/xexe")
# student_2.set_contacts(email: "nikitag.big2005@gmail.com", git: "https://github.com/NoidHuma")
# puts student_1
# puts ""
# puts student_2
# puts ""



