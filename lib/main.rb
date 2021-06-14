# /lib/main.rb

require_relative 'board.rb'
require_relative 'pawn.rb'
require_relative 'game.rb'
require_relative 'pieces.rb'

def play_game
  game = Game.new
  game.board.piece_setup
  game.board.display_board

  #game.board.coordinates_for_piece("K(b)")

  # this doesn't break out if a conidition is false. Real script will need to


  5.times do
    game.piece_selection
    game.move_to_coordinates
    game.find_coordinate_difference
    
    game.pass_pawn_variables
    game.pass_knight_variables
    game.pass_rook_variables
    game.pass_bishop_variables
    game.pass_queen_variables
    game.pass_king_variables

    game.board.display_board

    game.pawn.pawn_movement_checks
    game.knight.knight_movement_checks
    game.rook.rook_movement_checks
    game.bishop.bishop_movement_checks
    game.queen.queen_movement_checks
    game.king.king_movement_checks

    game.board.display_board


    game.check_each_piece


  end

end

play_game