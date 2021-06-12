require_relative "./pieces"

class King
  
  include Pieces

  def initialize
    @initialize_pieces = pieces_variables
    @valid_move = [[1, 1], [-1, 1], [1, -1], [-1, -1], [0, 1], [0, -1], [-1, 0], [1, 0]]
  end

  def is_king?
    if @board.piece_at_coordinates(@selected_piece) == "K(b)"
      @king_color = "K(b)"
      return true
    elsif @board.piece_at_coordinates(@selected_piece) == "K(w)"
      @king_color = "K(w)"
      return true
    end
  end

  def valid_king_move?
    @valid_move.each do |move|
      return true if move == @coordinate_difference
    end
    
  end

  def valid_end_coordinate?
    if @king_color == "K(b)" && (black_attack_white? == true || normal_move? == true) ||
       @king_color == "K(w)" && (white_attack_black? == true || normal_move? == true)
      return true
    end
  end

  def king_movement_checks 
    if is_king?
      if valid_end_coordinate? == true && valid_king_move? == true  # && is_check? == false
        move_piece(@selected_piece, @last, @king_color)
      else
        puts "redo piece entry"
      end
    end
  end



end