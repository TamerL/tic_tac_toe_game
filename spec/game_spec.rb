require 'rspec/autorun'
require './src/game'
require 'pry'


describe 'Game' do
  before do
    @player1 = double("Player")
    @player2 = double("Player")
    @board = double("Board", grid: [[0,0,0],[0,0,0],[0,0,0]])
    @game = Game.new(board: @board, player1: @player1, player2: @player2)
  end

  describe '.initialize' do

    it 'returns the instance variables when calling them through @game.variable' do
      expect(@game.player1).to eq(@player1)
      expect(@game.player2).to eq(@player2)
      expect(@game.board).to eq(@board)
      expect(@game.player_marker).to eq({:player1=>"x", :player2=>"o"})
    end
  end

  describe '#check_winner' do
    context 'check for the winner in the horizontal patterns' do
      it "returns 'Player1 wins!' when the top line is full of x" do
        allow(@board).to receive(:grid).and_return([['x','x','x'],['o','o',0],[0,0,0]])
        #xxx
        #oo0
        #000
        expect(@game.check_winner).to eq('Player1 wins!')
      end

      it "returns 'Player2 wins!' when the middle line is full of o" do
        allow(@board).to receive(:grid).and_return([['x','x',0],['o','o','o'],[0,0,0]])
        #xx0
        #ooo
        #000
        expect(@game.check_winner).to eq('Player2 wins!')
      end

      it "returns 'Player2 wins!' when the bottom line is full of o" do
        allow(@board).to receive(:grid).and_return([['x','x','o'],[0,'x','x'],['o','o','o']])
        #xxo
        #0xx
        #ooo
        expect(@game.check_winner).to eq('Player2 wins!')
      end
    end

    context 'check for the winner in the vertical patterns' do
      it "returns 'Player1 wins!' when the left column is full of x" do
        allow(@board).to receive(:grid).and_return([['x','x','o'],['x','o',0],['x',0,0]])
        #xxo
        #xo0
        #x00
        expect(@game.check_winner).to eq('Player1 wins!')
      end

      it "returns 'Player2 wins!' when the middle column is full of o" do
        allow(@board).to receive(:grid).and_return([['x','o',0],['o','o','x'],[0,'o',0]])
        #xo0
        #oox
        #0o0
        expect(@game.check_winner).to eq('Player2 wins!')
      end

      it "returns 'Player1 wins!' when the right column is full of x" do
        allow(@board).to receive(:grid).and_return([['o','o','x'],[0,'x','x'],['o','o','x']])
        #oox
        #0xx
        #oox
        expect(@game.check_winner).to eq('Player1 wins!')
      end
    end

    context 'check for the winner in the digonals patterns' do
      it "returns 'Player1 wins!' when the \ diagonal is full of x" do
        allow(@board).to receive(:grid).and_return([['x','x','o'],['x','x','o'],['o','o','x']])
        #xxo
        #xxo
        #oox
        expect(@game.check_winner).to eq('Player1 wins!')
      end

      it "returns 'Player2 wins!' when the / diagonal is full of o" do
        allow(@board).to receive(:grid).and_return([['x','o','o'],['x','o','x'],['o','x',0]])
        #xoo
        #xox
        #ox0
        expect(@game.check_winner).to eq('Player2 wins!')
      end
    end

    context 'when the grid is not full and there is no winner' do
      it "returns 'No one wins, keep playing!'" do
        allow(@board).to receive(:grid).and_return([['x','o','x'],['x','o','o'],['o','x',0]])
        #xox
        #xoo
        #oxx
        expect(@game.check_winner).to eq('No one wins, keep playing!')
      end
    end

    context 'when the grid is full and there is no winner' do
      it "returns 'The game is draw, No one wins!'" do
        allow(@board).to receive(:grid).and_return([['x','o','x'],['x','o','o'],['o','x','x']])
        #xox
        #xoo
        #oxx
        expect(@game.check_winner).to eq('The game is draw, No one wins!')
      end
    end

    context 'when the grid is full and there is a winner, say player2' do
      it "returns 'Player2 wins!'" do
        allow(@board).to receive(:grid).and_return([['x','o','o'],['x','o','x'],['o','x','x']])
        #xoo
        #xox
        #oxx
        expect(@game.check_winner).to eq('Player2 wins!')
      end
    end
  end
end
