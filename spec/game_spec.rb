require "./lib/game"
require "./lib/board"


describe Game do
  
  describe '#pawn_blockage' do
    
    subject(:test_game) { described_class.new }
    let(:new_board) { double('new_board', board: 
      
      [
      [' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  '],
      [' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  '],
      [' test  ', ' test  ', ' test  ', ' test  ', ' .  ', ' .  ', ' .  ', ' .  '],
      [' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  '],
      [' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  '],
      [' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  '],
      [' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  '],
      [' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ']
    ]) }

    context 'when no pieces blocking' do
      
      it 'return true' do

        test_game.instance_variable_set(:@start, [1, 1])
        test_game.instance_variable_set(:@last, [7, 1])
        test_game.instance_variable_set(:@board, new_board)

        expect(test_game.pawn_blockage?).to eq(true)
      end
    end
  end

end