# Psueodocode
# class Connect4
    #initialize
        #set up players
        #set up board
        #assign starting player


    #play
        #loop until break
            #render board
            #current player (p1)- ask for column
            #check win/tie
            #change player

    #valid move

    #game_over
        #check win || tie

    #check win

    #check tie

    #switch player

#Board
    #initialize
        #7 column, 6 row board

    #render
    #display the empty or used board

    # add piece

    # get_coordinates from player

    #valid coordinates input type?

    #valid move avaliable?

    #define win
        #LOT OF CODE

#Player
    #initialize
        #ask for player name
        #display player color

    #get_coordinates
            #loop until valid input
            #call ask_for_coordinates
            #check for format
            #check if valid input type (call board method)
            # check if valid_move_avaliable (call board method)
            #connect to add piece

    #ask_for coordinates


    #check for format

require './board.rb'
require './player.rb'



class Connect4
  def initialize
      puts "Welcome to Connect 4! A fun two player game !"
      @board= Board.new
      puts "Enter the name of Player 1 :"
      @player1= Player.new(gets.chomp,"X",@board)
      puts "Enter the name of Player 2 :"
      @player2= Player.new(gets.chomp,"O",@board)
      @currentplayer=@player1
  end

  def play
      while true
          @board.render
          @currentplayer.get_coordinates
          switch_players
          if game_over? 
          @board.render
          switch_players
          puts "GAME OVER!!! #{@currentplayer.name} is the winner!!"
              break
          end
          if check_tie?
            puts "TIE GAME!!!"
            break
          end
      end
  end

  def game_over?
      # if check_tie || check_win
      if check_win? 
          return true
      else
          return false
      end
  end

  def check_win?
      if @board.winning_combination?
          true
      else
          false
      end
  end

  def check_tie?
    if @board.full?
      true
    else 
      false
    end
  end

  def switch_players
      if @currentplayer==@player1
          @currentplayer=@player2
      elsif @currentplayer == @player2
          @currentplayer=@player1
      end
  end
end

c4=Connect4.new
c4.play

