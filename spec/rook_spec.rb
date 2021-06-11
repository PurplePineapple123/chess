require "./lib/rook"

describe Rook do
  describe '#valid_move' do
    
    subject(:move_test) { described_class.new }

    context 'when vertical move' do
      it 'returns true' do
        move_test.instance_variable_set(:@selected_piece, [4, 4]) #e5
        move_test.instance_variable_set(:@last, [5, 4]) #e6
      
        expect(move_test.valid_move?).to eq(true)
      end
    end

    context 'when left move' do
      it 'returns true' do
        move_test.instance_variable_set(:@selected_piece, [4, 4]) #e5
        move_test.instance_variable_set(:@last, [4, 2]) #c5
      
        expect(move_test.valid_move?).to eq(true)
      end
    end

  end

  describe '#rook_movement_left' do
    subject(:move_test) { described_class.new }
    subject(:board) { Board.new }

    context 'when the rook moves left with no blockage ' do
      it '@rook_blockage is false' do
       
        move_test.instance_variable_set(:@start, [4, 4]) #e5
        move_test.instance_variable_set(:@last, [4, 2]) #c5
      
        expect(move_test.rook_movement_left).to eq(true)
      end
    end
  end


end