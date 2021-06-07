# /lib/game.rb

require_relative 'board.rb'
require_relative './pawn'

class Game
  
  attr_reader :board, :selected_piece, :player_move, :coordinate_difference, :pawn

  def initialize
    @board = Board.new
    @pawn = Pawn.new
    @player_turn = 1
    @player_move 
    @selected_piece
    @coordinate_difference
    @start
    @last
  end

  def piece_selection
    # are these the right coordinates or do they need to be flipped?
    puts "Player #{@player_turn}, select the piece to move (Row, Column)"
    user_input = gets.chomp.split('')
    @selected_piece = user_input.each.map(&:to_i)
    @selected_piece = @selected_piece[1] - 1, @selected_piece[0] - 1
    @start = @selected_piece

    #@selected_piece
  end

  def pass_pawn_variables
    @pawn.selected_piece(@selected_piece)
    @pawn.start_variable(@start)
    @pawn.last_variable(@last)
    @pawn.pawn_coordinate_difference(@coordinate_difference)
    @pawn.pawn_board_access(@board)
  end

  def move_to_coordinates
    puts "Player #{@player_turn}, enter the coordinates to move to (Row, Column)"
    user_input = gets.chomp.split('')
    @player_move = user_input.each.map(&:to_i)
    @player_move = @player_move[1] - 1, @player_move[0] - 1

    @last = @player_move

    #@player_move
    # enter validation to make sure selected coordinates are not outside the grid
  end

  def find_coordinate_difference
    @coordinate_difference = @player_move[1] - @selected_piece[1], @player_move[0] - @selected_piece[0]
  end

#only configured for pawn right now
  # def move_piece 
  #   @board.update_board(@selected_piece, @player_move, @pawn.pawn_movement_checks)
  # end

end

# test = Game.new
# test.piece_selection
# test.move_to_coordinates
# test.pawn_blockage?

# test.piece_selection
# test.move_to_coordinates
# test.pawn_blockage?

