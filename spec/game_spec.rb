# frozen_string_literal: true

require 'rspec/autorun'
require './src/game'
require 'pry'

describe 'Game' do
  before do
    @player1 = double('Player', name: 'Player1')
    @player2 = double('Player', name: 'Player2')
    @board = double('Board', grid: [[0, 0, 0], [0, 0, 0], [0, 0, 0]])
    @game = Game.new(board: @board, player1: @player1, player2: @player2)
  end

  describe '.initialize' do
    it 'returns the instance variables when calling them through @game.variable' do
      expect(@game.player1).to eq(@player1)
      expect(@game.player2).to eq(@player2)
      expect(@game.board).to eq(@board)
      expect(@game.player_marker).to eq({ 'x' => @player1, 'o' => @player2 })
    end
  end

  describe '#write_onboard' do
    context 'when player1 plays' do
      it 'triggers write_onboard of the board' do
        expect(@board).to receive(:write_onboard).with('x', 4)
        @game.write_onboard(@player1, 4)
      end
    end
    context 'when player2 plays' do
      it 'triggers write_onboard of the board' do
        expect(@board).to receive(:write_onboard).with('o', 4)
        @game.write_onboard(@player2, 4)
      end
    end
  end

  describe '#get_winner' do
    context 'check for the winner in the horizontal patterns' do
      it 'returns @player1 when the top line is full of x' do
        allow(@board).to receive(:grid).and_return([%w[x x x], ['o', 'o', 0], [0, 0, 0]])
        # xxx
        # oo0
        # 000
        expect(@game.get_winner).to eq(@player1)
      end

      it 'returns @player2 when the middle line is full of o' do
        allow(@board).to receive(:grid).and_return([['x', 'x', 0], %w[o o o], [0, 0, 0]])
        # xx0
        # ooo
        # 000
        expect(@game.get_winner).to eq(@player2)
      end

      it 'returns @player2 when the bottom line is full of o' do
        allow(@board).to receive(:grid).and_return([%w[x x o], [0, 'x', 'x'], %w[o o o]])
        # xxo
        # 0xx
        # ooo
        expect(@game.get_winner).to eq(@player2)
      end
    end

    context 'check for the winner in the vertical patterns' do
      it 'returns @player1 when the left column is full of x' do
        allow(@board).to receive(:grid).and_return([%w[x x o], ['x', 'o', 0], ['x', 0, 0]])
        # xxo
        # xo0
        # x00
        expect(@game.get_winner).to eq(@player1)
      end

      it 'returns @player2 when the middle column is full of o' do
        allow(@board).to receive(:grid).and_return([['x', 'o', 0], %w[o o x], [0, 'o', 0]])
        # xo0
        # oox
        # 0o0
        expect(@game.get_winner).to eq(@player2)
      end

      it 'returns @player1 when the right column is full of x' do
        allow(@board).to receive(:grid).and_return([%w[o o x], [0, 'x', 'x'], %w[o o x]])
        # oox
        # 0xx
        # oox
        expect(@game.get_winner).to eq(@player1)
      end
    end

    context 'check for the winner in the digonals patterns' do
      it "returns @player1 when the \ diagonal is full of x" do
        allow(@board).to receive(:grid).and_return([%w[x x o], %w[x x o], %w[o o x]])
        # xxo
        # xxo
        # oox
        expect(@game.get_winner).to eq(@player1)
      end

      it 'returns @player2 when the / diagonal is full of o' do
        allow(@board).to receive(:grid).and_return([%w[x o o], %w[x o x], ['o', 'x', 0]])
        # xoo
        # xox
        # ox0
        expect(@game.get_winner).to eq(@player2)
      end
    end

    context 'when the grid is not full and there is no winner' do
      it 'returns nil' do
        allow(@board).to receive(:grid).and_return([%w[x o x], %w[x o o], ['o', 'x', 0]])
        # xox
        # xoo
        # oxx
        expect(@game.get_winner).to eq(nil)
      end
    end

    context 'when the grid is full and there is no winner' do
      it 'returns nil' do
        allow(@board).to receive(:grid).and_return([%w[x o x], %w[x o o], %w[o x x]])
        # xox
        # xoo
        # oxx
        expect(@game.get_winner).to eq(nil)
      end
    end

    context 'when the grid is full and there is a winner, if it is player2' do
      it 'returns @player2' do
        allow(@board).to receive(:grid).and_return([%w[x o o], %w[x o x], %w[o x x]])
        # xoo
        # xox
        # oxx
        expect(@game.get_winner).to eq(@player2)
      end
    end
  end
end
