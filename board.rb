class Array
  def safe_transpose
    max_size = self.map(&:size).max
    self.dup.map{|r| r << nil while r.size < max_size; r}.transpose
  end
end



class Board
   def initialize
       @board = Array.new(7){Array.new(6, "z")}
       @counter = 0
       @column=0
       @rowcoordinate=0
   end

   def render
       puts "--------- CONNECT 4 ---------"
       puts "-----------------------------"
       # if @counter>0
       #     monkey_around
       #     counter += 1
       # end
       @board.safe_transpose.each do |row|
           row.each do |cell|
               print "|"
               if cell == "z"
                 print("---")
               else
                 print(" #{cell.to_s} ")
               end
           end
       print "|"
       puts
       puts "-----------------------------"
       end

   end
   def add_piece(column,symbol)
       @column=column
       if column_avaliable?
          i=6
          while true
            if @board[column.to_i][i] == "z"
              @board[column.to_i][i]= symbol
               @rowcoordinate=i
              break
            else
              i-=1
              next
            end
          end
          return true
       else
            puts "That column is full, please choose another column !"
           return false
       end
   end

   def column_avaliable?
       if @board[@column.to_i][0]=='z'
           return true
       else
           return false
       end
   end
   def winning_combination?
       winning_vertical? || winning_horizontal? || winning_diagonal?
       #winning_diagonal? || winning_vertical? || winning horizontal?
   end

   def full?
      if (@board[0][0] != 'z' && @board[1][0] != 'z' && @board[2][0] != 'z' && @board[3][0] != 'z' && @board[4][0] != 'z' && @board[5][0] != 'z' && @board[6][0] != 'z')
        return true
      else 
        return false
      end
    end

   def winning_vertical?
       # coordinate=[@column,@rowcoordinate]
       # verticalarray=[@board[@column.to_i][@rowcoordinate.to_i],@board[@column.to_i][@rowcoordinate.to_i-1],@board[@column.to_i][@rowcoordinate.to_i-2],@board[@column.to_i][@rowcoordinate.to_i-3]]
       verticalarray=[@board[@column.to_i][5],@board[@column.to_i][4],@board[@column.to_i][3],
       @board[@column.to_i][2],@board[@column.to_i][1],@board[@column.to_i][0]]
       four_in_a_row?(verticalarray)
   end
   def four_in_a_row?(arr)
       arr.join.to_s.include?("XXXX") || arr.join.to_s.include?("OOOO")
   end
   def winning_horizontal?
      horizontalarray=[@board[0][@rowcoordinate],@board[1][@rowcoordinate],
      @board[2][@rowcoordinate],@board[3][@rowcoordinate],@board[4][@rowcoordinate],
      @board[5][@rowcoordinate], @board[6][@rowcoordinate]]
      four_in_a_row?(horizontalarray)
   end

  def winning_diagonal?
    upleft(@column.to_i,@rowcoordinate.to_i) || upright(@column.to_i,@rowcoordinate.to_i)
  end


  def upright(tempcolumn,tempcoordinate)
    i=0
    until tempcolumn==(0||-1) || tempcoordinate== (0||-1)

      checkarray=[]
      checkarray << @board[tempcolumn+i][tempcoordinate+i]

    end
  end

 def upleft (tempcolumn, tempcoordinate) 
     n=0 
     i=0
      checkarray = []
      checkpointcolumn=tempcolumn
      checkpointcoordinate=tempcoordinate
      #downright
     until i ==4
      if tempcolumn == -1 ||tempcolumn == 7 || tempcoordinate == -1 || tempcoordinate == 6
        break
      end
       checkarray << @board[tempcolumn][tempcoordinate]
       tempcolumn += 1
       tempcoordinate+=1
       i+=1
       puts i
     end
     #upleft
     tempcolumn=checkpointcolumn-1
     tempcoordinate=checkpointcoordinate-1
     until n ==3
      if tempcolumn == -1 || tempcoordinate == -1 || tempcolumn == 7 || tempcoordinate == 6
        break
      end
       checkarray.unshift(@board[tempcolumn][tempcoordinate])
       tempcolumn -= 1
       tempcoordinate-=1
       n+=1
     end

     if four_in_a_row?(checkarray)
        return true
      else 
        return false
      end
    end

    def upright (tempcolumn, tempcoordinate) 
     n=0 
     i=0
      checkarray = []
      checkpointcolumn=tempcolumn
      checkpointcoordinate=tempcoordinate
      #downright
     until i ==4
         if tempcolumn == -1 || tempcoordinate == -1 || tempcolumn == 7 || tempcoordinate == 6  
          break
      end
       checkarray << @board[tempcolumn][tempcoordinate]
       tempcolumn -= 1
       tempcoordinate+=1
       i+=1
     end
     #upleft
     tempcolumn=checkpointcolumn-1
     tempcoordinate=checkpointcoordinate-1
     until n ==3
        if tempcolumn == -1 || tempcoordinate == -1 || tempcolumn == 7 || tempcoordinate == 6
        break
      end
       checkarray.unshift(@board[tempcolumn][tempcoordinate])
       tempcolumn += 1
       tempcoordinate-=1
       n+=1
     end

     if four_in_a_row?(checkarray)
        return true
      else 
        return false
      end
    end
end



