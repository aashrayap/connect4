class Board 
	def initialize()
		@board = Array.new(6){Array.new(7)}
	end
	
	def render
		puts 
		@board.each do |row|
			row.each do |cell|
				cell.nil? print "-" : print cell.to_s
			end
			puts
		end
		puts
	end
	def monkey_around
		newboard =@board[array[0][0],array[1,0],array[2,0],array[3,0],array[4,0],array[5,0],
			[array[0][1],array[1,1],array[2,1],array[3,1],array[4,1],array[5,1],
			[array[0][2],array[1,2],array[2,2],array[3,2],array[4,2],array[5,2],
			[array[0][3],array[1,3],array[2,3],array[3,3],array[4,3],array[5,3],
			[array[0][4],array[1,4],array[2,4],array[3,4],array[4,4],array[5,4],
			[array[0][5],array[1,5],array[2,5],array[3,5],array[4,5],array[5,5]]
	end

	def monkey_back_around
		@board =newboard[array[0][0],array[1,0],array[2,0],array[3,0],array[4,0],array[5,0],
			[array[0][1],array[1,1],array[2,1],array[3,1],array[4,1],array[5,1],
			[array[0][2],array[1,2],array[2,2],array[3,2],array[4,2],array[5,2],
			[array[0][3],array[1,3],array[2,3],array[3,3],array[4,3],array[5,3],
			[array[0][4],array[1,4],array[2,4],array[3,4],array[4,4],array[5,4],
			[array[0][5],array[1,5],array[2,5],array[3,5],array[4,5],array[5,5]]

	def add_piece(column,symbol)
		newboard=monkey_around
		if column_avaliable
			newboard[column].push(symbol)
			true
		else
			false
		end
	end

	def column_avaliable(newboard,column)
		if newboard[column].size <6 
			return true
		else 
			return false
		end
	end

	def winning_combination(symbol)
		winning_diagonal? || winning_vertical? || winning horizontal?
	end
	




end

# [[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6][1,2,3,4,5,6]]

# newarray= [[array[0][0],array[1,0],array[2,0],array[3,0],array[4,0],array[5,0],
# 			[array[0][1],array[1,1],array[2,1],array[3,1],array[4,1],array[5,1],
# 			[array[0][2],array[1,2],array[2,2],array[3,2],array[4,2],array[5,2],
# 			[array[0][3],array[1,3],array[2,3],array[3,3],array[4,3],array[5,3],
# 			[array[0][4],array[1,4],array[2,4],array[3,4],array[4,4],array[5,4],
# 			[array[0][5],array[1,5],array[2,5],array[3,5],array[4,5],array[5,5]]