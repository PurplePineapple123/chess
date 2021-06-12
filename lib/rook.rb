require_relative "./pieces"

class Rook
  include Pieces

  def initialize
    @initialize_pieces = pieces_variables
  end

  def is_rook?
    if @board.piece_at_coordinates(@selected_piece) == "R(b)"
      @rook_color = "R(b)"
      return true
    elsif @board.piece_at_coordinates(@selected_piece) == "R(w)"
      @rook_color = "R(w)"
      return true
    end
  end

 

  def valid_end_coordinate?
    if @rook_color == "R(b)" && (black_attack_white? == true || normal_move? == true) ||
       @rook_color == "R(w)" && (white_attack_black? == true || normal_move? == true)
      return true
    end
  end

  def rook_movement
    if @last[0] > @selected_piece[0]
      piece_movement_up
    elsif @last[0] < @selected_piece[0]
      piece_movement_down
    elsif @last[1] > @selected_piece[1]
      piece_movement_right
    elsif @last[1] < @selected_piece[1]
      piece_movement_left
    end
  end

  def rook_movement_checks
    if is_rook?
      rook_movement
      if valid_end_coordinate? == true && @piece_blockage == false && valid_move? == true
        move_piece(@selected_piece, @last, @rook_color)
      else
        puts "redo piece entry"
      end
    end
  end

end

