# /lib/game.rb

require_relative 'board.rb'
require_relative './pawn'

class Game
  
  include Pawn

  attr_reader :board, :last

  def initialize
    @board = Board.new
    @player_turn = 1
    @player_move 
    @selected_piece
    @coordinate_difference
    @pawn_blockage = false
    @start
    @last
  end

  def piece_selection
    # are these the right coordinates or do they need to be flipped?
    puts "Player #{@player_turn}, select the piece to move (Row, Column)"
    user_input = gets.chomp.split('')
    @selected_piece = user_input.each.map(&:to_i)
    @start = @selected_piece

    #@selected_piece
  end

  def move_to_coordinates
    puts "Player #{@player_turn}, enter the coordinates to move to (Row, Column)"
    user_input = gets.chomp.split('')
    @player_move = user_input.each.map(&:to_i)
    @last = @player_move

    #@player_move
    # enter validation to make sure selected coordinates are not outside the grid
  end

  def find_coordinate_difference
    @coordinate_difference = @player_move[0] - @selected_piece[0], @player_move[1] - @selected_piece[1]
  end

  def pawn_blockage?

    until @start == @last || @pawn_blockage == true
      @start = @start[0] + 1, @start[1]
      if @board.board[@start[0]][@start[1]] == ' .  '
        puts "start: #{@start}"
      else
        puts 'pawn blockage'
        @pawn_blockage = true
      end
    end
    
    @pawn_blockage == true ? true : false

  end

  def pawn_first_move?
    return true if @selected_piece[0] == 1
  end 

  def is_pawn?
    if @board.board[@start[0]][@start[1]] == 'P(b)' ||
       @board.board[@start[0]][@start[1]] == 'P(w)'
      return true
    else
      puts "nope"
    end
  end

  def temp_pawn_script
    piece_selection
    move_to_coordinates
    find_coordinate_difference
    
    if is_pawn? && valid_move? && pawn_blockage? == false
      puts "yeet"
    end
  end


end

# test = Game.new
# test.piece_selection
# test.move_to_coordinates
# test.pawn_blockage?

# test.piece_selection
# test.move_to_coordinates
# test.pawn_blockage?

