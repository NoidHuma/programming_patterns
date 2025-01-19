require_relative "DataList.rb"
class DataListStudent < DataList
    def get_names()
        ["ID", "Fullname", "Git", "Telegram", "Email", "Phone"]
    end
    
    private
    # переопределяем make_row
    def make_row(index)
      [index + 1, @elements[index].fullname, @elements[index].git, @elements[index].telegram, @elements[index].email, @elements[index].phone]
    end
end