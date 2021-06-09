# /lib/game.rb

require_relative 'board.rb'
require_relative './knight'

require_relative './pawn'

class Game
  
  attr_reader :board, :selected_piece, :player_move, :coordinate_difference, :pawn, :knight

  def initialize
    @board = Board.new
    @pawn = Pawn.new
    @knight = Knight.new
    #@rook = Rook.new
    @player_turn = 1
    @player_move 
    @selected_piece
    @coordinate_difference
    @start
    @last
    @letter_number = {'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8}
  end

  def pass_pawn_variables
    @pawn.selected_piece(@selected_piece)
    @pawn.start_variable(@start)
    @pawn.last_variable(@last)
    @pawn.pawn_coordinate_difference(@coordinate_difference)
    @pawn.board_access(@board)
  end

  def pass_knight_variables
    @knight.selected_piece(@selected_piece)
    @knight.start_variable(@start)
    @knight.last_variable(@last)
    @knight.pawn_coordinate_difference(@coordinate_difference)
    @knight.board_access(@board)
  end

  def pass_rook_variables
    @rook.selected_piece(@selected_piece)
    @rook.start_variable(@start)
    @rook.last_variable(@last)
    @rook.pawn_coordinate_difference(@coordinate_difference)
    @rook.board_access(@board)
  end

  def piece_selection
    # need to add proper letter check (make all lowercase)
    # proper input check(error handling loop)
    
   
    puts "Player #{@player_turn}, select the piece to move (Column, Row)"
    user_input = gets.chomp.split('')
    user_input[0] = @letter_number[user_input[0]]
    @selected_piece = user_input.each.map(&:to_i)
    @selected_piece = @selected_piece[1] - 1, @selected_piece[0] - 1
    @start = @selected_piece
  end


  def move_to_coordinates
    puts "Player #{@player_turn}, enter the coordinates to move to (Column, Row)"
    user_input = gets.chomp.split('')
    user_input[0] = @letter_number[user_input[0]]
    @player_move = user_input.each.map(&:to_i)
    @player_move = @player_move[1] - 1, @player_move[0] - 1
    @last = @player_move

    # enter validation to make sure selected coordinates are not outside the grid
  end

  def find_coordinate_difference
    @coordinate_difference = @player_move[1] - @selected_piece[1], @player_move[0] - @selected_piece[0]
  end


end

#test = Game.new
#test.piece_selection
# test.move_to_coordinates
# test.pawn_blockage?

# test.piece_selection
 #test.move_to_coordinates
# test.pawn_blockage?

