class DataTable
	private attr_reader :matr

	def initialize(matr)
		self.matr = matr
	end

	private def matr=(matr)
		unless matr.is_a?(Array) && matr.all? {|row| row.is_a?(Array)}
			raise ArgumentError, "Параметром должен быть двумерный массив!"
		end
	
		@matr = matr.map{|arr| arr.dup}
	end

	def get_element(row, col)
		unless (0...self.row_count).include?(row) && (0...self.column_count).include?(col)
			return nil
		end
		self.matr[row][col]
	end

	def row_count()
		self.matr.size
	end

	def column_count()
        if self.matr.empty?
            return 0
        end

        self.matr[0].size
    end

end
