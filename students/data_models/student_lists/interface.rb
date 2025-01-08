class StorageStrategy

  def read_from_file(file_path)
      raise NotImplementedError, "#{self.class} должен реализовать #read_from_file"
  end

  def write_to_file(file_path, students)
      raise NotImplementedError, "#{self.class} должен реализовать #write_to_file"
  end
  
end