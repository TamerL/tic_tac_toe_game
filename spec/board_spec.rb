require 'rspec/autorun'
require './src/board'
require 'pry'



describe 'Board' do
  before do
    @board = Board.new
  end

  describe '.initialize' do
    it 'returns an empty board' do
      expect(@board.grid).to eq([[0,0,0],[0,0,0],[0,0,0]])
      # expect(@board).to receive(:grid).and_return([[0,0,0],[0,0,0],[0,0,0]])
    end
  end

  describe '#write_onboard' do
    it "will write 'mark' on the board grid" do
      @board.write_onboard('mark',4)
      #0   0  0
      #0'mark'0
      #0   0  0
      expect(@board.grid).to eq([[0,0,0],[0,'mark',0],[0,0,0]])
    end

    it "raise an error if the intended position was already written at" do
      @board.write_onboard('mark',4)
      #0   0  0
      #0'mark'0
      #0   0  0
      expect do
        @board.write_onboard('mark',4)
      end.to raise_error("Position 4 has been already written at")
    end

    it "raise an error if a player tries to write on an invalid place" do
      #000
      #000
      #000
      expect do
        @board.write_onboard('mark',9)
      end.to raise_error("Invalid position! please select from 0 to 8")
    end
  end
end
