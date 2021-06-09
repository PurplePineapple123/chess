require "./lib/pawn"
require './lib/pieces'
require "./lib/board"

describe Pawn do
  describe "#pawn_first_move" do
    subject(:first_move) { described_class.new }

    context "when pawn hasnt moved" do
      before do
        first_move.instance_variable_set(:@selected_piece, [1, 1])
        first_move.instance_variable_set(:@pawn_piece, "P(w)")
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
        valid_move.instance_variable_set(:@coordinate_difference, [0, 2])
        allow(valid_move).to receive(:pawn_first_move?).and_return(true)
        valid_move.instance_variable_set(:@pawn_piece, "P(w)")
      end

      it "return true" do
        expect(valid_move.valid_move?).to eq(true)
      end
    end

    context "when invalid pawn first move" do
      before do
        valid_move.instance_variable_set(:@coordinate_difference, [0, 3])
        allow(valid_move).to receive(:pawn_first_move?).and_return(true)
      end

      it "return true" do
        expect(valid_move.valid_move?).not_to eq(true)
      end
    end

    context "when valid pawn second move" do
      before do
        valid_move.instance_variable_set(:@coordinate_difference, [0, 1])
        allow(valid_move).to receive(:pawn_first_move?).and_return(false)
        valid_move.instance_variable_set(:@pawn_piece, "P(w)")

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
        attack.instance_variable_set(:@last, [2, 7])
        attack.instance_variable_set(:@board, new_board)

        allow(new_board).to receive(:piece_at_coordinates).with([2, 7]).and_return('P(b)')
      end

      it 'return true' do
        expect(attack.attack_correct_color).to eq(true)
      end
    end
  end


  describe '#pawn_color' do
    subject(:pawn_color) { described_class.new }
    let(:new_board) { double('new_board')}

    context 'when selected piece is black pawn' do
       before do
        pawn_color.instance_variable_set(:@board, new_board)
        allow(new_board).to receive(:piece_at_coordinates).and_return('P(b)')
       end

      it 'returns a black pawn' do
        
        expect(pawn_color.pawn_color).to eq("P(b)")
      end
    end
  end

end
