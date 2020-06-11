require 'rspec/autorun'
require './src/board'

describe '.initialize' do
  it 'returns an empty board' do
    board = Board.new
    expect(board.grid).to eq([[0,0,0],[0,0,0],[0,0,0]])
  end
end
