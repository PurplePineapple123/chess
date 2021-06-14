require_relative "./pieces"

class Bishop
  include Pieces

  def initialize
    @initialize_pieces = pieces_variables
  end

  def is_bishop?
    if @board.piece_at_coordinates(@selected_piece) == "B(b)"
      @bishop_color = "B(b)"
      return true
    elsif @board.piece_at_coordinates(@selected_piece) == "B(w)"
      @bishop_color = "B(w)"
      return true
    end
  end

  def valid_end_coordinate?
    if @bishop_color == "B(b)" && (black_attack_white? == true || normal_move? == true) ||
       @bishop_color == "B(w)" && (white_attack_black? == true || normal_move? == true)
      return true
    end
  end

  def bishop_movement
    if @last[0] > @selected_piece[0] && @last[1] > @selected_piece[1]
      piece_movement_up_right
    elsif @last[0] < @selected_piece[0] && @last[1] > @selected_piece[1]
      piece_movement_down_right
    elsif @last[0] > @selected_piece[0] && @last[1] < @selected_piece[1]
      piece_movement_up_left
    elsif @last[0] < @selected_piece[0] && @last[1] < @selected_piece[1]
      piece_movement_down_left
    end
  end

  def bishop_movement_checks
    if is_bishop?
      bishop_movement
      if valid_end_coordinate? == true && @piece_blockage == false && valid_diagonal_move? == true
        move_piece(@selected_piece, @last, @bishop_color)
      else
        puts "redo piece entry"
      end
    end
  end

  def bishop_check_king?(piece)
    if piece == "B(w)"
      @last = @board.coordinates_for_piece("K(b)")
    elsif piece == "B(b)"
      @last = @board.coordinates_for_piece("K(w)")
    end

    @coordinate_difference = @last[1] - @selected_piece[1], @last[0] - @selected_piece[0]

    if is_bishop?
      bishop_movement
      if valid_end_coordinate? == true && @piece_blockage == false && valid_diagonal_move? == true
        @check = true
        puts "Bishop to King is in Check: #{@selected_piece}, #{@last}"
        # else
        #   puts "Rook no check"
      end
    end
  end
end
