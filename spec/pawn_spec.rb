require "./lib/pawn"
require './lib/pieces'
require "./lib/board"

describe Pawn do
  describe "#pawn_first_move" do
    subject(:first_move) { described_class.new }

    context "when pawn hasnt moved" do
      before do
        first_move.instance_variable_set(:@selected_piece, [1, 1])
      end
      it "returns true" do
        expect(first_move.pawn_first_move?).to eq(true)
      end
    end

    context "when pawn has moved" do
      before do
        first_move.instance_variable_set(:@selected_piece, [3, 1])
      end

      it "does not return true" do
        expect(first_move.pawn_first_move?).not_to eq(true)
      end
    end
  end

  describe "#valid_move?" do
    subject(:valid_move) { described_class.new }
    
    context "when valid pawn first move" do
      before do
        valid_move.instance_variable_set(:@coordinate_difference, [2, 0])
        allow(valid_move).to receive(:pawn_first_move?).and_return(true)
      end

      it "return true" do
        expect(valid_move.valid_move?).to eq(true)
      end
    end

    context "when invalid pawn first move" do
      before do
        valid_move.instance_variable_set(:@coordinate_difference, [3, 0])
        allow(valid_move).to receive(:pawn_first_move?).and_return(true)
      end

      it "return true" do
        expect(valid_move.valid_move?).not_to eq(true)
      end
    end

    context "when valid pawn second move" do
      before do
        valid_move.instance_variable_set(:@coordinate_difference, [1, 0])
        allow(valid_move).to receive(:pawn_first_move?).and_return(false)
      end

      it "return true" do
        expect(valid_move.valid_move?).to eq(true)
      end
    end
  end

  describe '#attack_correct_color' do
    subject(:attack) { described_class.new }
    let(:new_board) { double('new_board', board: 
      [
      ['R(w)', 'N(w)', 'B(w)', 'Q(w)', 'K(w)', 'B(w)', 'N(w)', 'R(w)'],
      ['P(w)', 'P(w)', 'P(w)', 'P(w)', 'P(w)', 'P(w)', 'P(w)', 'P(w)'],
      [' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  '],
      [' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  '],
      [' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  '],
      [' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  ', ' .  '],
      ['P(b)', 'P(b)', 'P(b)', 'P(b)', 'P(b)', 'P(b)', 'P(b)', 'P(b)'],
      ['R(b)', 'N(b)', 'B(b)', 'Q(b)', 'K(b)', 'B(b)', 'N(b)', 'R(b)']
    ]) }

    context 'when pawn is white and attack move (diagonal) is made' do

      before do
        attack.instance_variable_set(:@pawn_piece, 'P(w)') 
        attack.instance_variable_set(:@last, [7, 2])
        attack.instance_variable_set(:@black_pieces, ['P(b)', 'R(b)', 'N(b)', 'B(b)', 'Q(b)', 'K(b)'])
        attack.instance_variable_set(:@board, new_board)

        allow(new_board).to receive(:piece_at_coordinates).with([7, 2]).and_return('P(b)')
      end

      it 'return true' do
        
        #expect(new_board.piece_at_coordinates([7, 2])).to eq('test')
        expect(attack.attack_correct_color).to eq(true)
      end
    end
  end

end
