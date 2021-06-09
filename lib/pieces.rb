
module Pieces

  def pieces_variables
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

  def board_access(board)
    @board = board
  end
  
  def move_piece(selected_piece, last, piece)
    @board.update_board(selected_piece, last, piece)
  end

  def white_attack_black?
    @black_pieces.each do |piece|
      if piece == @board.piece_at_coordinates(@last)
        return true
      else
        return false
      end
    end
  end

  def black_attack_white?
    @white_pieces.each do |piece|
      if piece == @board.piece_at_coordinates(@last)
        return true
      else
        return false
      end
    end
  end

  def normal_move?
    return true if @board.piece_at_coordinates(@last) == " .  "
  end

end
