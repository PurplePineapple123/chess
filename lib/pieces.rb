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
    return true if @board.piece_at_coordinates(@last) == " .  "
  end

  def valid_diagonal_move?
    return true if ((@coordinate_difference[0]).abs) == ((@coordinate_difference[1]).abs)
  end

  def valid_move?
    if (@selected_piece[0] < @last[0] || @selected_piece[0] > @last[0]) && @selected_piece[1] == @last[1] ||
       (@selected_piece[1] < @last[1] || @selected_piece[1] > @last[1]) && @selected_piece[0] == @last[0]
      return true
    end
  end

  def piece_movement_up
    @piece_blockage = false
    temporary_piece = @selected_piece

    until temporary_piece[0] == @last[0] - 1 || @piece_blockage == true
      temporary_piece = temporary_piece[0] + 1, temporary_piece[1]
      return @piece_blockage = true if @board.piece_at_coordinates(temporary_piece) != " .  "
    end
  end

  def piece_movement_down
    @piece_blockage = false
    temporary_piece = @selected_piece


    until temporary_piece[0] == @last[0] + 1 || @piece_blockage == true
      temporary_piece = temporary_piece[0] - 1, temporary_piece[1]
      return @piece_blockage = true if @board.piece_at_coordinates(temporary_piece) != " .  "
    end
  end

  def piece_movement_left
    @piece_blockage = false
    temporary_piece = @selected_piece

    until temporary_piece[1] == @last[1] + 1 || @piece_blockage == true
      temporary_piece = temporary_piece[0], temporary_piece[1] - 1
      return @piece_blockage = true if @board.piece_at_coordinates(temporary_piece) != " .  "
    end
  end

  def piece_movement_right
    @piece_blockage = false
    temporary_piece = @selected_piece

    until temporary_piece[1] == @last[1] - 1 || @piece_blockage == true
      temporary_piece = temporary_piece[0], temporary_piece[1] + 1
      return @piece_blockage = true if @board.piece_at_coordinates(temporary_piece) != " .  "
    end
  end

  # diagonal moves
  def piece_movement_up_right
    @piece_blockage = false
    temporary_piece = @selected_piece
    #puts "up right"
    until temporary_piece[0] == @last[0] - 1 || @piece_blockage == true
      temporary_piece = temporary_piece[0] + 1, temporary_piece[1] + 1
      return @piece_blockage = true if @board.piece_at_coordinates(temporary_piece) != " .  "
    end
  end

  def piece_movement_down_right
    @piece_blockage = false
    temporary_piece = @selected_piece
    #puts "down right"
    until temporary_piece[0] == @last[0] + 1 || @piece_blockage == true
      temporary_piece = temporary_piece[0] - 1, temporary_piece[1] + 1
      return @piece_blockage = true if @board.piece_at_coordinates(temporary_piece) != " .  "
    end
  end

  def piece_movement_up_left
    @piece_blockage = false
    temporary_piece = @selected_piece
    #puts "up left"
    until temporary_piece[1] == @last[1] + 1 || @piece_blockage == true
      temporary_piece = temporary_piece[0] + 1, temporary_piece[1] - 1
      return @piece_blockage = true if @board.piece_at_coordinates(temporary_piece) != " .  "
    end
  end

  def piece_movement_down_left
    @piece_blockage = false
    temporary_piece = @selected_piece
    #puts "down left"
    until temporary_piece[1] == @last[1] + 1 || @piece_blockage == true
      temporary_piece = temporary_piece[0] - 1, temporary_piece[1] - 1
      return @piece_blockage = true if @board.piece_at_coordinates(temporary_piece) != " .  "
    end
  end
end
