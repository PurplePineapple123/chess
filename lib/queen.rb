require_relative "./pieces"

class Queen
  
  include Pieces

  def initialize
    @initialize_pieces = pieces_variables
  end

  def is_queen?
    if @board.piece_at_coordinates(@selected_piece) == "Q(b)"
      @queen_color = "Q(b)"
      return true
    elsif @board.piece_at_coordinates(@selected_piece) == "Q(w)"
      @queen_color = "Q(w)"
      return true
    end
  end

  def valid_end_coordinate?
    if @queen_color == "Q(b)" && (black_attack_white? == true || normal_move? == true) ||
       @queen_color == "Q(w)" && (white_attack_black? == true || normal_move? == true)
      return true
    end
  end

  def queen_movement
    if @last[0] > @selected_piece[0] && @last[1] > @selected_piece[1]
      piece_movement_up_right
    elsif @last[0] < @selected_piece[0] && @last[1] > @selected_piece[1]
      piece_movement_down_right
    elsif @last[0] > @selected_piece[0] && @last[1] < @selected_piece[1]
      piece_movement_up_left
    elsif @last[0] < @selected_piece[0] && @last[1] < @selected_piece[1]
      piece_movement_down_left
    elsif @last[0] > @selected_piece[0]
      piece_movement_up
    elsif @last[0] < @selected_piece[0]
      piece_movement_down
    elsif @last[1] > @selected_piece[1]
      piece_movement_right
    elsif @last[1] < @selected_piece[1]
      piece_movement_left
    end
  end


  def queen_movement_checks 
    if is_queen?
      queen_movement
      if valid_end_coordinate? == true && @piece_blockage == false && (valid_diagonal_move? == true || valid_move? == true)
        move_piece(@selected_piece, @last, @queen_color)
      else
        puts "redo piece entry"
      end
    end
  end


end