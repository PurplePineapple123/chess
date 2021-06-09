require_relative "./pieces"

class Knight
  include Pieces

  def initialize
    @moves = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [2, -1], [-1, 2], [-2, 1]]
    @initialize_pieces = pieces_variables
  end

  def is_knight?
    if @board.piece_at_coordinates(@start) == "N(b)"
      @knight_color = "N(b)"
      true
    elsif @board.piece_at_coordinates(@start) == "N(w)"
      @knight_color = "N(w)"
      true
    else
      false
    end
  end

  def valid_move?
    if @knight_color == "N(b)" && (black_attack_white? || normal_move?)
      return true
    elsif @knight_color == "N(w)" && (white_attack_black? || normal_move?)
      return true
    end
  end



  def knight_movement_checks
    if is_knight?
      if valid_move? == true 
        move_piece(@selected_piece, @last, @knight_color)
      else
        puts "redo piece entry"
      end
    end
  end

  private

  def white_attack_black?
    @black_pieces.each do |piece|
      if piece == @board.piece_at_coordinates(@last)
        return true
      end
    end
  end

  def black_attack_white?
    @white_pieces.each do |piece|
      if piece == @board.piece_at_coordinates(@last)
        return true
      end
    end
  end

  def normal_move?
    return true if @board.piece_at_coordinates(@last) == ' .  '
  end

  

end
