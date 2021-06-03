# /lib/game.rb

class Game
  
  def initialize
    @player_turn = 1
    @player_move = []
    @selected_piece = []
  end

  def piece_selection
    # are these the right coordinates or do they need to be flipped?

    puts "Player #{@player_turn}, select the piece to move (Row, Column)"
    user_input = gets.chomp.split('')
    @selected_piece << user_input.each.map(&:to_i)
  end

  def move_to_coordinates
    puts "Player #{@player_turn}, enter the coordinates to move to (Row, Column)"
    user_input = gets.chomp.split('')
    @player_move << user_input.each.map(&:to_i)
    # enter validation to make sure selected coordinates are not outside the grid


  end

end

test = Game.new
test.piece_selection
test.move_to_coordinates

