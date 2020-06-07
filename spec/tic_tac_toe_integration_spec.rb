require 'rspec/autorun'
require './src/tic_tac_toe'

describe 'tic tac toe integration test:' do
  context "when the game is ongoing" do
    before do
      x = Player.new()
      o = Player.new()
      board = Board.new()
      game = Game.new()
    end
    it "writes on the board then prints it" do
      expect(game.write_onboard(x,4)).to eq("   |   |   \n------------\n   | X |   \n------------\n   |   |   ")
    end

    it "ends the game if the board is full without winner" do
      board.brd = [ *%w[x o], nil, *%w[x o x o x o]]
      expect(game.write_onboard(x,2)).to eq("There is no winner, Game is Drawn!")
    end

    it "checks for the winner in pattern #1" do
      board.brd.fill('o',0..1)
      expect(game.write_onboard(o,2)).to eq("Player o wins!")
    end

    it "checks for the winner in pattern #2" do
      board.brd.fill('o',3..4)
      expect(game.write_onboard(o,5)).to eq("Player o wins!")
    end

    it "checks for the winner in pattern #3" do
      board.brd.fill('o',6..7)
      expect(game.write_onboard(o,8)).to eq("Player o wins!")
    end

    it "checks for the winner in pattern #4" do
      [0,3].each{|x| board.brd[x]='o'}
      expect(game.write_onboard('o',6)).to eq("Player o wins!")
    end

    it "checks for the winner in pattern #4" do
      [1,4].each{|x| board.brd[x]='o'}
      expect(game.write_onboard('o',7)).to eq("Player o wins!")
    end

    it "checks for the winner in pattern #4" do
      [2,5].each{|x| board.brd[x]='o'}
      expect(game.write_onboard('o',8)).to eq("Player o wins!")
    end

    it "checks for the winner in pattern #4" do
      [0,4].each{|x| board.brd[x]='o'}
      expect(game.write_onboard('o',8)).to eq("Player o wins!")
    end

    it "checks for the winner in pattern #4" do
      [2,4].each{|x| board.brd[x]='o'}
      expect(game.write_onboard('o',6)).to eq("Player o wins!")
    end
  end

  context "when the board doesn't exist" do
    it "returns an error" do
      x = Player.new()
      o = Player.new()
      game = Game.new()
      expect do
        game.write_onboard(x,4)
      end.to raise_error("raised error")
    end
  end

  context "when the players do not exist" do
    it "returns an error" do
      board = Board.new()
      game = Game.new()
      expect do
        game.write_onboard(x,4)
      end.to raise_error("raised error")
    end
  end
end
