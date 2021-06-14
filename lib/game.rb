# /lib/game.rb

require_relative 'board.rb'
require_relative './knight'
require_relative './rook'
require_relative './pawn'
require_relative './bishop'
require_relative './queen'
require_relative './king'


class Game
  
  attr_reader :board, :selected_piece, :player_move, :coordinate_difference, 
              :pawn, :knight, :rook, :bishop, :queen, :king

  def initialize
    @board = Board.new
    @pawn = Pawn.new
    @knight = Knight.new
    @rook = Rook.new
    @bishop = Bishop.new
    @queen = Queen.new
    @king = King.new
    @player_turn = 1
    @player_move 
    @selected_piece
    @coordinate_difference
    @start
    @last
    @letter_number = {'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8}
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


  def check_each_piece
    
    # problem, for duplicate pieces, only the first one (with its first coordinates of appearance) are shown


    @board.board.each_with_index do |sub_array, y|
      sub_array.each_with_index do |piece, x|
      @selected_piece = [y, x]
      @start = @selected_piece

      if @board.piece_at_coordinates(@selected_piece) == 'R(w)'

        @rook.selected_piece(@selected_piece)
        @rook.selected_piece(@start)
        @rook.rook_check_king?(piece)
      end

      end
    end
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

  def pass_bishop_variables
    @bishop.selected_piece(@selected_piece)
    @bishop.start_variable(@start)
    @bishop.last_variable(@last)
    @bishop.pawn_coordinate_difference(@coordinate_difference)
    @bishop.board_access(@board)
  end

  def pass_queen_variables
    @queen.selected_piece(@selected_piece)
    @queen.start_variable(@start)
    @queen.last_variable(@last)
    @queen.pawn_coordinate_difference(@coordinate_difference)
    @queen.board_access(@board)
  end

  def pass_king_variables
    @king.selected_piece(@selected_piece)
    @king.start_variable(@start)
    @king.last_variable(@last)
    @king.pawn_coordinate_difference(@coordinate_difference)
    @king.board_access(@board)
  end

end

