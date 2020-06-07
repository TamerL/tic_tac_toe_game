require 'rspec/autorun'
require './src/tic_tac_toe.rb'

describe '#tic_tac_toe' do
  context 'show up the 3*3 board at game startup' do
    it 'returns this string when starting the game' do
      game = Game.new
      expect(game.start).to eq("   |   |   \n------------\n   |   |   \n------------\n   |   |  ")
    end
  end
end
