# /lib/main.rb

require_relative 'board.rb'
require_relative 'pawn.rb'
require_relative 'game.rb'
require_relative 'pieces.rb'

def play_game
  game = Game.new
  game.board.piece_setup
  
  3.times do
  game.piece_selection
  game.move_to_coordinates
  game.find_coordinate_difference

  game.board.display_board

  game.is_pawn?
  game.pawn_first_move?
  game.valid_move?
  game.pawn_blockage?

  game.move_piece

  game.board.display_board
  end

end

play_game