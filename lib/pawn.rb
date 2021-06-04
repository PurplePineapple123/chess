# /lib/pawn.rb


module Pawn
  #include Pieces
  
  @first_move = [[2, 0], [1, 0]]
  @normal_move = [[1, 0]]
  @attack_move = [[1, 1], [-1, 1]]
  @elligible_move

  # using piece rules, is this a valid move?
  def valid_move?
    test
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



  def test
    piece_selection
    move_to_coordinates
  end

  

  def is_pawn?

  end

  def attack_move?
    # if diagonal moves contain black pieces (not white)


  end

  
end
