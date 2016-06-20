class Player 
	def initialize(name,symbol,board)
		attr_accessor :name :symbol
		@name=name
		@symbol=symbol
		@board=board
	end

	def get_coordinates
		while true
			column=ask_for_coordinates
			if check_for_format(column)
				if board.add_piece(column,@symbol)
					break
				end
			end
		end
	end

	def everything_valid
	end

	def ask_for_coordinates
		puts "Please enter a valid column number: "
		gets.chomp #make equal to variable if error in this line
	end

	def check_for_format(column)
		if column == (1..6)
			puts "good format"
		else
			puts "Wront Format"
		end
	end
end





