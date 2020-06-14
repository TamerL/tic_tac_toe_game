require 'rspec/autorun'
require './src/game'


describe 'Game' do
  before do
    @player1 = double("Player")
    @player2 = double("Player")
    @board = double("Board", grid: [[0,0,0],[0,0,0],[0,0,0]])
    @game = Game.new(board: @board, player1: @player1, player2: @player2)
  end

  describe '.initialize' do

    it 'creates an instance of Game by passing instances of 2 players and 1 board' do
      expect(Game.new(board: @board, player1: @player1, player2: @player2))
    end

    # it 'raise an error if the board is missing' do
    #   expect do
    #     Game.new(player1: @player1, player2: @player2)
    #   end.to raise_error("unable to create a game without a board")
    # end
    #
    # it 'raise an error if a player is missing' do
    #   expect do
    #     Game.new(board: @board, player2: @player2)
    #   end.to raise_error("unable to create a game, need one more player")
    #
    #   expect do
    #     Game.new(board: @board, player1: @player1)
    #   end.to raise_error("unable to create a game, need one more player")
    # end
    #
    # it 'raise an error if more than 2 players are passed' do
    #   @player3 = double("Player")
    #   expect do
    #     Game.new(board: @board, player1: @player1, player2: @player2, player3: @player3)
    #   end.to raise_error("only 2 players can play the game")
    # end

    it 'returns the player1 instance when calling @game.player1' do
      @game = Game.new(board: @board, player1: @player1, player2: @player2)
      expect(@game.player1).to eq(@player1)
    end

    it 'returns the player2 instance when calling @game.player2' do
      @game = Game.new(board: @board, player1: @player1, player2: @player2)
      expect(@game.player2).to eq(@player2)
    end

    it 'returns the board instance when calling @game.board' do
      @game = Game.new(board: @board, player1: @player1, player2: @player2)
      expect(@game.board).to eq(@board)
    end

    it 'returns the player_marker hash of the game when calling @game.player_marker' do
      expect(@game.player_marler).to eq({:player1=>"x", :player2=>"o"})
    end
  end

  describe '#write_onboard' do

    it "will write 'x' on the board grid when player1 plays" do
      @game.write_onboard(@player1,4)
      expect(@board.grid).to eq([[0,0,0],[0,'x',0],[0,0,0]])
    end

    it "will write 'x' on the board grid when player1 plays" do
      @game.write_onboard(@player2,5)
      expect(@board.grid).to eq([[0,0,0],[0,'x','o'],[0,0,0]])
    end

    it "raise an error if a player try to write on a place that was already written at" do
      expect do
        @game.write_onboard(@player2,4))
      end.to raise_error("This place has been already written at")
    end

    it "raise an error if a player try to write on an invalid place" do
      expect do
        @game.write_onboard(@player2,9))
      end.to raise_error("Invalid location! please select from 0 to 8")
    end
  end

  describe '#check_winner' do

    context 'check for the winner in the horizontal patterns' do
      it "returns 'Player1 wins!' when the top line is full of x"
      @board = double("Board", grid: [['x','x','x'],['o','o',0],[0,0,0]])
      expect(@game.check_winner).to eq('Player1 wins!')
    end

    it "returns 'Player2 wins!' when the middle line is full of o" do
      @board = double("Board", grid: [['x','x',0],['o','o','o'],[0,0,0]])
      expect(@game.check_winner).to eq('Player2 wins!')
    end

    it "returns 'Player2 wins!' when the bottom line is full of o" do
      @board = double("Board", grid: [['x','x','o'],[0,'x','x'],['o','o','o']])
      expect(@game.check_winner).to eq('Player2 wins!')
    end


    context 'check for the winner in the vertical patterns' do
      it "returns 'Player1 wins!' when the left column is full of x"
      @board = double("Board", grid: [['x','x','o'],['x','o',0],['x',0,0]])
      expect(@game.check_winner).to eq('Player1 wins!')
    end

    it "returns 'Player2 wins!' when the middle column is full of o" do
      @board = double("Board", grid: [['x','o',0],['o','o','x'],[0,'o',0]])
      expect(@game.check_winner).to eq('Player2 wins!')
    end

    it "returns 'Player1 wins!' when the right column is full of x" do
      @board = double("Board", grid: [['x','o','x'],[0,'x','x'],['o','o','x']])
      expect(@game.check_winner).to eq('Player1 wins!')
    end
  end
  context 'check for the winner in the digonals patterns' do
    it "returns 'Player1 wins!' when the \ diagonal is full of x"
    @board = double("Board", grid: [['x','x','o'],['x','x','o'],['o','o','x']])
    expect(@game.check_winner).to eq('Player1 wins!')
  end

  it "returns 'Player2 wins!' when the / diagonal is full of o" do
    @board = double("Board", grid: [['x','o','o'],['x','o','x'],['o','x',0]])
    expect(@game.check_winner).to eq('Player2 wins!')
  end

  it "returns 'The game is draw, No one wins!' when the grid become full with no winner" do
    @board = double("Board", grid: [['x','o','x'],['x','o','o'],['o','x','x']])
    expect(@game.check_winner).to eq('The game is draw, No one wins!')
  end

  it "returns 'Player2 wins!' when the grid become full and there is a winner" do
    @board = double("Board", grid: [['x','o','o'],['x','o','x'],['o','x','x']])
    expect(@game.check_winner).to eq('Player2 wins!')
  end
end
