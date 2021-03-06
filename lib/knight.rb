require_relative "./pieces"

class Knight
  include Pieces

  def initialize
    @moves = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [2, -1], [-1, 2], [-2, 1]]
    @initialize_pieces = pieces_variables
  end

  def is_knight?
    if @board.piece_at_coordinates(@selected_piece) == "N(b)"
      @knight_color = "N(b)"
      true
    elsif @board.piece_at_coordinates(@selected_piece) == "N(w)"
      @knight_color = "N(w)"
      true
    else
      false
    end
  end

  def valid_move?
    @moves.each do |move|
      if move == @coordinate_difference
        return true
      end
    end      
  end

  def valid_end_coordinate?
    if @knight_color == "N(b)" && (black_attack_white? || normal_move?)
      return true
    elsif @knight_color == "N(w)" && (white_attack_black? || normal_move?)
      return true
    end
    
  end

  def knight_movement_checks
    if is_knight?
      if valid_move? == true && valid_end_coordinate? == true
        move_piece(@selected_piece, @last, @knight_color)
      else
        puts "redo piece entry"
      end
    end
  end


  def knight_check_king?(piece)
    if piece == "N(w)"
      @last = @board.coordinates_for_piece("K(b)")
    elsif piece == "N(b)"
      @last = @board.coordinates_for_piece("K(w)")
    end

    @coordinate_difference = @last[1] - @selected_piece[1], @last[0] - @selected_piece[0]

    if is_knight?
      if valid_move? == true && valid_end_coordinate? == true
        @check = true
        puts "Knight to King is in Check: #{@selected_piece}, #{@last}"
      # else
      #   puts "Queen no check"
      end
    end
  end

end
