require 'rspec/autorun'
require './src/game'


describe 'Game' do

  describe '.initialize' do
    before do
      @player1 = double("Player")
      @player2 = double("Player")
      @board = double("Board")
    end

    it 'creates an instance of Game by passing instances of 2 players and 1 board' do
      expect(Game.new(board: @board, player1: @player1, player2: @player2))
    end

    it 'raise an error if the board is missing' do
      expect do
        Game.new(player1: @player1, player2: @player2)
      end.to raise_error("unable to create a game without a board")
    end

    it 'raise an error if a player is missing' do
      expect do
        Game.new(board: @board, player2: @player2)
      end.to raise_error("unable to create a game, need one more player")

      expect do
        Game.new(board: @board, player1: @player1)
      end.to raise_error("unable to create a game, need one more player")
    end

    it 'raise an error if more than 2 players are passed' do
      @player3 = double("Player")
      expect do
        Game.new(board: @board, player1: @player1, player2: @player2, player3: @player3)
      end.to raise_error("only 2 players can play the game")
    end
  end

  describe '#write_onboard' do
    before do
      @player1 = double("Player", name: 'x')
      @player2 = double("Player", name: 'o')
      @board = double("Board", grid: [[0,0,0],[0,0,0],[0,0,0]])
      # allow(@player1).to receive(:name).and_return('x')
      # allow(@board).to receive(:grid).and_return([[0,0,0],[0,0,0],[0,0,0]])
      @game = Game.new(board: @board, player1: @player1, player2: @player2)
    end

    it "will write player1 name on the board grid" do
      expect(@game.write_onboard(@player1,4)).to eq([[0,0,0],[0,'x',0],[0,0,0]])
    end

    it "will write player2 name on the board grid" do
      expect(@game.write_onboard(@player2,5)).to eq([[0,0,0],[0,'x','o'],[0,0,0]])
    end

    it "raise an error if a player try to write on a place that was already written at" do
      expect do
        @game.write_onboard(@player2.name,4))
      end.to raise_error("This place has been already written at")
    end

    describe '#check_winner' do
      before do
        @player1 = double("Player", name: 'x')
        @player2 = double("Player", name: 'o')
        @game = Game.new(board: @board, player1: @player1, player2: @player2)
      end

      context 'check for the winner in the horizontal patterns' do
        it "returns 'Player1 wins!' when the top line is full of x"
        @board = double("Board", grid: [['x','x','x'],['o','o',0],[0,0,0]])
        expect(check_winner).to eq('Player1 wins!')
      end

      it "returns 'Player2 wins!' when the middle line is full of o" do
        @board = double("Board", grid: [['x','x',0],['o','o','o'],[0,0,0]])
        expect(check_winner).to eq('Player2 wins!')
      end

      it "returns 'Player2 wins!' when the bottom line is full of o" do
        @board = double("Board", grid: [['x','x','o'],[0,'x','x'],['o','o','o']])
        expect(check_winner).to eq('Player2 wins!')
      end
    end
  end
end
