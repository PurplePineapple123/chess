# /lib/pawn.rb
require_relative "./pieces"

class Pawn
  include Pieces

  attr_reader :last

  def initialize
    @pawn_blockage = false
    @first_move_white = [[0, 2], [0, 1]]
    @normal_move_white = [[0, 1]]
    @attack_move_white = [[1, 1], [-1, 1]]

    @first_move_black = [[0, -2], [0, -1]]
    @normal_move_black = [[0, -1]]
    @attack_move_black = [[-1, -1], [1, -1]]

    @initialize_pieces = pieces_variables
  end

  # is piece a pawn?
  def is_pawn?
    if @board.piece_at_coordinates(@selected_piece) == "P(b)" ||
       @board.piece_at_coordinates(@selected_piece) == "P(w)"
      true
    else
      false
    end
  end

  # is it the pawns first move?

  def pawn_first_move?
    return true if (@selected_piece[0] == 1 && @pawn_piece == "P(w)") ||
                   (@selected_piece[0] == 6 && @pawn_piece == "P(b)")
  end

  # using piece rules, is this a valid move?
  def valid_move?
    if attack_move? == true
      true
    elsif pawn_first_move?
      if @pawn_piece == "P(w)"
        first_move_white
      elsif @pawn_piece == "P(b)"
        first_move_black
      end
    else
      if @pawn_piece == "P(w)"
        normal_move_white
      elsif @pawn_piece == "P(b)"
        normal_move_black
      end
    end
  end

  # is there a piece in the way of the desired move?
  def pawn_blockage?
    if attack_move? == true
      return @pawn_blockage = false
    end

    if @pawn_piece == "P(w)"
      pawn_blockage_white_test
    elsif @pawn_piece == "P(b)"
      pawn_blockage_black_test
    end

    @pawn_blockage == true ? true : false
  end

  def pawn_color
    if @board.piece_at_coordinates(@selected_piece) == "P(b)"
      @pawn_piece = "P(b)"
    elsif @board.piece_at_coordinates(@selected_piece) == "P(w)"
      @pawn_piece = "P(w)"
    end
  end

  def attack_move?
    if @pawn_piece == "P(b)"
      attack_move_black
    elsif @pawn_piece == "P(w)"
      attack_move_white
    end
  end

  # if it's a black pawn and diagonal contains a white piece, valid attack move
  def attack_correct_color
    if @pawn_piece == "P(b)"
      @white_pieces.each do |piece|
        if piece == @board.piece_at_coordinates(@last)
          return true
        end
      end
    elsif @pawn_piece == "P(w)"
      @black_pieces.each do |piece|
        if piece == @board.piece_at_coordinates(@last)
          return true
        end
      end
    end
  end

  def pawn_movement_checks
    if is_pawn?
      pawn_color
      if valid_move? == true && pawn_blockage? == false
        p @selected_piece
        p @last
        move_piece(@selected_piece, @last, @pawn_piece)
      else
        puts valid_move?
        puts "redo piece entry"
      end
    end
  end

  private

  def first_move_white
    @first_move_white.each do |coordinate|
      return true if coordinate == @coordinate_difference
    end
  end

  def first_move_black
    @first_move_black.each do |coordinate|
      return true if coordinate == @coordinate_difference
    end
  end

  def attack_move_white
    @attack_move_white.each do |coordinate|
      return true if coordinate == @coordinate_difference && attack_correct_color == true
    end
  end

  def attack_move_black
    @attack_move_black.each do |coordinate|
      return true if coordinate == @coordinate_difference && attack_correct_color == true
    end
  end

  def normal_move_white
    @normal_move_white.each do |coordinate|
      return true if coordinate == @coordinate_difference
    end
  end

  def normal_move_black
    @normal_move_black.each do |coordinate|
      return true if coordinate == @coordinate_difference
    end
  end

  def pawn_blockage_white_test
    temporary_piece = @selected_piece

    until temporary_piece == @last || @pawn_blockage == true
      temporary_piece = temporary_piece[0] + 1, temporary_piece[1]
      if @board.piece_at_coordinates(temporary_piece) == " .  "
        #puts "start: #{temporary_piece}"
      else
        puts "pawn blockage"
        @pawn_blockage = true
      end
    end
  end

  def pawn_blockage_black_test
    temporary_piece = @selected_piece

    until temporary_piece == @last || @pawn_blockage == true
      temporary_piece = temporary_piece[0] - 1, temporary_piece[1]
      if @board.piece_at_coordinates(temporary_piece) == " .  "
        #puts "start: #{temporary_piece}"
      else
        puts "pawn blockage"
        @pawn_blockage = true
      end
    end
  end
end
