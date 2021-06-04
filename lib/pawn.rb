# /lib/pawn.rb


module Pawn
  #include Pieces
  
  
  @attack_move = [[1, 1], [-1, 1]]
  @elligible_move

  
  # is piece a pawn?
  def is_pawn?
    
    if @board.board[@start[0]][@start[1]] == 'P(b)' ||
       @board.board[@start[0]][@start[1]] == 'P(w)'
      return true
    else
      puts "nope"
    end
  end

  # is it the pawns first move?
  def pawn_first_move?
    return true if @selected_piece[0] == 1
  end 
  
  # using piece rules, is this a valid move?
  def valid_move?
    @first_move = [[2, 0], [1, 0]]
    @normal_move = [[1, 0]]
    
    if pawn_first_move?
      @first_move.each do |coordinate|
        if coordinate == find_coordinate_difference
          @elligible_move = coordinate
          return true
        end
      end
    else
      @normal_move.each do |coordinate|
        if coordinate == find_coordinate_difference
          @elligible_move = coordinate
          return true
        end
      end
    end
  end

  # is there a piece in the way of the desired move?
  def pawn_blockage?
    until @start == @last || @pawn_blockage == true
      @start = @start[0] + 1, @start[1]
      if @board.board[@start[0]][@start[1]] == ' .  '
        puts "start: #{@start}"
      else
        puts 'pawn blockage'
        @pawn_blockage = true
      end
    end
    
    @pawn_blockage == true ? true : false

  end

  def move_pawn?
    if is_pawn? && valid_move? && pawn_blockage? == false
      puts "move"
      return true
    end
  end

  def attack_move?
    # if diagonal moves contain black pieces (not white)
  end

  
end
