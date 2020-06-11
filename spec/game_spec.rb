require 'rspec/autorun'
require './src/game'

describe 'Game'
context 'given a board and 2 players were created already' do
  before do
    @player1 = double("Player")
    @player2 = double("Player")
    @board = double("Board")
  end

  describe '.initialize' do
    it 'create an instance of game by passing instances of 2 players and 1 board' do
      expect(Game.new(board: @board, player1: @player1, player2: @player2))
    end
  end

  describe '#write_onboard'
  before do
    allow(@board).to receive(:arr).and_return([[0,0,0],[0,0,0],[0,0,0]])
    allow(@player1).to receive(:name).and_return('x')
    allow(@player2).to receive(:name).and_return('o')
    @game = Game.new(board: @board, player1: @player1, player2: @player2)
  end

    it "writes on the board then prints it" do
      expect(@game.write_onboard(@player1.name,4)).to eq([[0,0,0],[0,'x',0],[0,0,0]])
    end

end
