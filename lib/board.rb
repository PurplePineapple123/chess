# /lib/board.rb


class Board
  
  attr_reader :board
  
  def initialize
    @board = Array.new(8) { Array.new([' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ']) }
  end

  def display_board(board = @board)
    
    puts "8 | #{board[7][0]} | #{board[7][1]} | #{board[7][2]} | #{board[7][3]} | #{board[7][4]} | #{board[7][5]} | #{board[7][6]} | #{board[7][7]}"
    puts "7 | #{board[6][0]} | #{board[6][1]} | #{board[6][2]} | #{board[6][3]} | #{board[6][4]} | #{board[6][5]} | #{board[6][6]} | #{board[6][7]}"
    puts "6 | #{board[5][0]} | #{board[5][1]} | #{board[5][2]} | #{board[5][3]} | #{board[5][4]} | #{board[5][5]} | #{board[5][6]} | #{board[5][7]}"
    puts "5 | #{board[4][0]} | #{board[4][1]} | #{board[4][2]} | #{board[4][3]} | #{board[4][4]} | #{board[4][5]} | #{board[4][6]} | #{board[4][7]}"
    puts "4 | #{board[3][0]} | #{board[3][1]} | #{board[3][2]} | #{board[3][3]} | #{board[3][4]} | #{board[3][5]} | #{board[3][6]} | #{board[3][7]}"
    puts "3 | #{board[2][0]} | #{board[2][1]} | #{board[2][2]} | #{board[2][3]} | #{board[2][4]} | #{board[2][5]} | #{board[2][6]} | #{board[2][7]}"
    puts "2 | #{board[1][0]} | #{board[1][1]} | #{board[1][2]} | #{board[1][3]} | #{board[1][4]} | #{board[1][5]} | #{board[1][6]} | #{board[1][7]}"
    puts "1 | #{board[0][0]} | #{board[0][1]} | #{board[0][2]} | #{board[0][3]} | #{board[0][4]} | #{board[0][5]} | #{board[0][6]} | #{board[0][7]}"
    puts '     A1  |  B2  |  C3  |  D4  |  E5  |  F6  |  G7  |  H8  '
  end

  def piece_setup
    @board[1] = ['P(w)', 'P(w)', 'P(w)', 'P(w)', 'P(w)', 'P(w)', 'P(w)', 'P(w)']
    @board[0] = ['R(w)', 'N(w)', 'B(w)', 'Q(w)', 'K(w)', 'B(w)', 'N(w)', 'R(w)']
  
    @board[6] = ['P(b)', 'P(b)', 'P(b)', 'P(b)', 'P(b)', 'P(b)', 'P(b)', 'P(b)']
    @board[7] = ['R(b)', 'N(b)', 'B(b)', 'Q(b)', 'K(b)', 'B(b)', 'N(b)', 'R(b)']
  end

  def piece_at_coordinates(piece)
    @board[piece[0]][piece[1]]
  end

  def update_board(start, last, piece)
    @board[start[0]][start[1]] = ' .  '
    
    if piece == 'P(b)'
      @board[last[0]][last[1]] = 'P(b)'
    elsif piece == 'P(w)'
      @board[last[0]][last[1]] = 'P(w)'
    end
  end

  def reflect_game_board
    
  end



end

# new_board = Board.new
# new_board.display_board