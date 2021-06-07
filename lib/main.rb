# /lib/main.rb

require_relative 'board.rb'
require_relative 'pawn.rb'
require_relative 'game.rb'
require_relative 'pieces.rb'

def play_game
  game = Game.new
  game.board.piece_setup
  
  # this doesn't break out if a conidition is false. Real script will need to
  5.times do
  game.piece_selection
  game.move_to_coordinates
  game.find_coordinate_difference
  game.pass_pawn_variables

  game.board.display_board

  game.pawn.pawn_movement_checks

  game.board.display_board
  end

end

play_game