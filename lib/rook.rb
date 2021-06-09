require_relative "./pieces"

class Rook
  
  include Pieces

  def initialize
    @initialize_pieces = pieces_variables

  end

  def is_rook?
    if @board.piece_at_coordinates(@start) == "R(b)"
      @rook_color = "R(b)"
      true
    elsif @board.piece_at_coordinates(@start) == "R(w)"
      @rook_color = "R(w)"
      true
    else
      false
    end
  end

  def rook_movement
    if @last[1] > @start[0]
      rook_movement_north
    elsif

    end


  end


  def rook_movement_north
    until @start == @last || @rook_blockage == true
      @start = @start[0], @start[1] + 1
      if @board.piece_at_coordinates(@start) == " .  "
        puts "start: #{@start}"
      else
        puts "pawn blockage"
        @pawn_blockage = true
      end
    end
  end

end