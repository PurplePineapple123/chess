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
    else
      false
    end
  end

  def valid_move?
    if (@selected_piece[0] < @last[0] || @selected_piece[0] > @last[0]) && @selected_piece[1] == @last[1] ||
       (@selected_piece[1] < @last[1] || @selected_piece[1] > @last[1]) && @selected_piece[0] == @last[0]
       
       return true
    else 
      return false
    end
  end

  def valid_end_coordinate?
    if @rook_color == "R(b)" && (black_attack_white? == true || normal_move? == true)
      return true
    elsif @rook_color == "R(w)" && (white_attack_black? == true || normal_move? == true)
      return true
    end
  end

  def rook_movement
    
    if @last[0] > @selected_piece[0]
      rook_movement_up
    elsif @last[0] < @selected_piece[0]
      rook_movement_down
    elsif @last[1] > @selected_piece[1]
        rook_movement_right
    elsif @last[1] < @selected_piece[1]
       rook_movement_left
    end
  end


  def rook_movement_checks    
    if is_rook?
      rook_movement
      if valid_end_coordinate? == true && @rook_blockage == false && valid_move? == true
        move_piece(@selected_piece, @last, @rook_color)
      else
        puts "redo piece entry"
      end
    end
  end

  private

  # this just isnt working on the very @last

  def rook_movement_up
    @rook_blockage = false

    
    until @start[0] == @last[0] - 1 || @rook_blockage == true
      @start = @start[0] + 1, @start[1]
      return @rook_blockage = true if @board.piece_at_coordinates(@start) != " .  "
    end
  end

  # if the color is white and it is an attack move thenn...
  def rook_movement_down
    @rook_blockage = false

    until @start[0] == @last[0] + 1 || @rook_blockage == true
      @start = @start[0] - 1, @start[1]
      return @rook_blockage = true if @board.piece_at_coordinates(@start) != " .  "
    end
  end

  # test for blockage on all but the last item
  def rook_movement_left
    @rook_blockage = false

    until @start[1] == @last[1] + 1 || @rook_blockage == true
      @start = @start[0], @start[1] - 1
      return @rook_blockage = true if @board.piece_at_coordinates(@start) != " .  "
    end
    
  end

  def rook_movement_right
    @rook_blockage = false
    
    until @start[1] == @last[1] - 1 || @rook_blockage == true
      @start = @start[0], @start[1] + 1
      return @rook_blockage = true if @board.piece_at_coordinates(@start) != " .  "
    end
  end

  

end

# rook = Rook.new
# rook.rook_movement