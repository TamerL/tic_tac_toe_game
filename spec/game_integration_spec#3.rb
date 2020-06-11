require 'rspec/autorun'
require './src/game'
require './src/player'
require './src/board'

describe 'tic tac toe integration test:' do
  context "when the game is ongoing" do
    before do
      @player1 = Player.new('x')
      @player2 = Player.new('o')
      @board = Board.new
      @game = Game.new(player1: @player1, player2: @player2 , board: @board)
    end

    pending
    it "returns array of 0's when the game start" do
      expect(@game.board.grid).to eq([[0,0,0],[0,0,0],[0,0,0]])
    end

    pending
    it "returns 'no winner so far, keep going!' when check_winner is called" do
      expect(check_winner).to eq('no winner so far, keep going!')
    end

    pending
    it "writes on the board then prints it" do
      expect(@game.write_onboard(@player1.name,4)).to eq([[0,0,0],[0,'x',0],[0,0,0]])
    end

    pending
    it "returns 'no winner so far, keep going!' when check_winner is called" do
      expect(check_winner).to eq('no winner so far, keep going!')
    end

    pending
    it "writes on the board then prints it" do
      expect(@game.write_onboard(@player2.name,1)).to eq([[0,'o',0],[0,'x',0],[0,0,0]])
    end

    pending
    it "returns 'no winner so far, keep going!' when check_winner is called" do
      expect(check_winner).to eq('no winner so far, keep going!')
    end

    pending
    it "writes on the board then prints it" do
      expect(@game.write_onboard(@player1.name,2)).to eq([[0,'o','x'],[0,'x',0],[0,0,0]])
    end

    pending
    it "returns 'no winner so far, keep going!' when check_winner is called" do
      expect(check_winner).to eq('no winner so far, keep going!')
    end

    pending
    it "writes on the board then prints it" do
      expect(@game.write_onboard(@player2.name,6)).to eq([[0,'o','x'],[0,'x',0],['o',0,0]])
    end

    pending
    it "returns 'no winner so far, keep going!' when check_winner is called" do
      expect(check_winner).to eq('no winner so far, keep going!')
    end

    pending
    it "writes on the board then prints it" do
      expect(@game.write_onboard(@player1.name,8)).to eq([[0,'o','x'],[0,'x',0],['o',0,'x']])
    end

    pending
    it "returns 'no winner so far, keep going!' when check_winner is called" do
      expect(check_winner).to eq('no winner so far, keep going!')
    end

    pending
    it "writes on the board then prints it" do
      expect(@game.write_onboard(@player2.name,0)).to eq([['o','o','x'],[0,'x',0],['o',0,'x']])
    end

    pending
    it "returns 'no winner so far, keep going!' when check_winner is called" do
      expect(check_winner).to eq('no winner so far, keep going!')
    end

    pending
    it "writes on the board then prints it" do
      expect(@game.write_onboard(@player1.name,0)).to eq([['o','o','x'],[0,'x','x'],['o',0,'x']])
    end

    pending
    it "returns 'no winner so far, keep going!' when check_winner is called" do
      expect(check_winner).to eq("Player '#{player1.name}' wins!")
    end
  #
  #
  # pending
  # context "when the board doesn't exist" do
  #
  #   it "returns an error" do
  #     x = Player.new()
  #     o = Player.new()
  #     game = Game.new()
  #     expect do
  #       game.write_onboard(x,4)
  #     end.to raise_error("raised error")
  #   end
  # end
  #
  # pending
  # context "when the players do not exist" do
  #   it "returns an error" do
  #     board = Board.new()
  #     game = Game.new()
  #     expect do
  #       game.write_onboard(x,4)
  #     end.to raise_error("raised error")
  #   end
  # end
end
