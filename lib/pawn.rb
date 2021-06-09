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

    @white_pieces = ["P(w)", "R(w)", "N(w)", "B(w)", "Q(w)", "K(w)"]
    @black_pieces = ["P(b)", "R(b)", "N(b)", "B(b)", "Q(b)", "K(b)"]
  end

  def selected_piece(piece)
    @selected_piece = piece
  end

  def start_variable(start)
    @start = start
  end

  def last_variable(last)
    @last = last
  end

  def pawn_coordinate_difference(coordinate)
    @coordinate_difference = coordinate
  end

  def pawn_board_access(board)
    @board = board
  end

  # is piece a pawn?
  def is_pawn?
    if @board.piece_at_coordinates(@start) == "P(b)" ||
       @board.piece_at_coordinates(@start) == "P(w)"
      puts "is a pawn"
      true
    else
      false
    end
  end

  # is it the pawns first move?

  def pawn_first_move?
    puts @selected_piece[0]

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
      # else
      #   @normal_move.each do |coordinate|
      #     if coordinate == @coordinate_difference
      #       @elligible_move = coordinate
      #       return true
      #     end
      #   end
    end
  end

  # is there a piece in the way of the desired move?
  def pawn_blockage?
    if attack_move? == true
      return @pawn_blockage = false
    end

    if @pawn_piece == "P(w)"
      until @start == @last || @pawn_blockage == true
        @start = @start[0] + 1, @start[1]
        if @board.piece_at_coordinates(@start) == " .  "
          puts "start: #{@start}"
        else
          puts "pawn blockage"
          @pawn_blockage = true
        end
      end
    end

    if @pawn_piece == "P(b)"
      puts "start: #{@start}"

      puts "last: #{@last}"

      until @start == @last || @pawn_blockage == true
        @start = @start[0] - 1, @start[1]
        if @board.piece_at_coordinates(@start) == " .  "
          puts "start: #{@start}"
        else
          puts "pawn blockage"
          @pawn_blockage = true
        end
      end
    end

    @pawn_blockage == true ? true : false
  end

  def pawn_color
    if @board.piece_at_coordinates(@start) == "P(b)"
      @pawn_piece = "P(b)"
    elsif @board.piece_at_coordinates(@start) == "P(w)"
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

  def move_piece
    @board.update_board(@selected_piece, @last, @pawn_piece)
  end

  def pawn_movement_checks
    if is_pawn?
      pawn_color
      if valid_move? == true && pawn_blockage? == false
        move_piece
      else
        puts valid_move?
        puts "redo piece entry"
      end
    else
      puts "not a pawn"
    end
  end

  private

  def first_move_white
    @first_move_white.each do |coordinate|
      if coordinate == @coordinate_difference
        return true
      end
    end
  end

  def first_move_black
    @first_move_black.each do |coordinate|
      if coordinate == @coordinate_difference
        return true
      end
    end
  end

  def attack_move_white
    @attack_move_white.each do |coordinate|
      if coordinate == @coordinate_difference && attack_correct_color == true
        return true
      end
    end
  end

  def attack_move_black
    @attack_move_black.each do |coordinate|
      if coordinate == @coordinate_difference && attack_correct_color == true
        return true
      end
    end
  end
end
