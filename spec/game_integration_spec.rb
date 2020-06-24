require 'rspec/autorun'
require './src/game'
require './src/player'
require './src/board'
require 'pry'



describe 'Running different game scenarios and checking the results' do
  before do
    @player1 = Player.new('x')
    @player2 = Player.new('o')
    @board = Board.new
    @game = Game.new(player1: @player1, player2: @player2 , board: @board)
  end

  context "1) Scenario #1: Player2 wins:" do
    # pending
    it "returns array of 0's when the game start" do
      expect(@game.board.grid).to eq([[0,0,0],[0,0,0],[0,0,0]])
    end
    # pending
    it "allow players to write to the grid, then returns 'Player 'O' wins!'" do
      expect(@game.board.grid).to eq([[0,0,0],[0,0,0],[0,0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player1,4)
      expect(@game.board.grid).to eq([[0,0,0],[0,'x',0],[0,0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player2,0)
      expect(@game.board.grid).to eq([['o',0,0],[0,'x',0],[0,0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player1,2)
      expect(@game.board.grid).to eq([['o',0,'x'],[0,'x',0],[0,0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player2,6)
      expect(@game.board.grid).to eq([['o',0,'x'],[0,'x',0],['o',0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player1,5)
      expect(@game.board.grid).to eq([['o',0,'x'],[0,'x','x'],['o',0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player2,3)
      expect(@game.board.grid).to eq([['o',0,'x'],['o','x','x'],['o',0,0]])
      expect(@game.check_winner).to eq("#{@player2.name} wins!")
    end
  end

  context "2) Scenario #2: The game is draw" do
    # pending
    it "allow players to write to the grid, then returns 'The game is draw, no body wins!'" do
      @game.write_onboard(@player1,0)
      expect(@game.board.grid).to eq([['x',0,0],[0,0,0],[0,0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player2,1)
      expect(@game.board.grid).to eq([['x','o',0],[0,0,0],[0,0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player1,7)
      expect(@game.board.grid).to eq([['x','o',0],[0,0,0],[0,'x',0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player2,4)
      expect(@game.board.grid).to eq([['x','o',0],[0,'o',0],[0,'x',0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player1,3)
      expect(@game.board.grid).to eq([['x','o',0],['x','o',0],[0,'x',0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player2,6)
      expect(@game.board.grid).to eq([['x','o',0],['x','o',0],['o','x',0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player1,2)
      expect(@game.board.grid).to eq([['x','o','x'],['x','o',0],['o','x',0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player2,5)
      expect(@game.board.grid).to eq([['x','o','x'],['x','o','o'],['o','x',0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player1,8)
      expect(@game.board.grid).to eq([['x','o','x'],['x','o','o'],['o','x','x']])
      expect(@game.check_winner).to eq("The game is draw, no one wins!")
    end
  end

  context "3) Scenario #3: Player1 wins" do
    # pending
    it "allow players to write to the grid, then returns 'This game is draw, no body wins!'" do
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player1,4)
      expect(@game.board.grid).to eq([[0,0,0],[0,'x',0],[0,0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player2,1)
      expect(@game.board.grid).to eq([[0,'o',0],[0,'x',0],[0,0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player1,2)
      expect(@game.board.grid).to eq([[0,'o','x'],[0,'x',0],[0,0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player2,6)
      expect(@game.board.grid).to eq([[0,'o','x'],[0,'x',0],['o',0,0]])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player1,8)
      expect(@game.board.grid).to eq([[0,'o','x'],[0,'x',0],['o',0,'x']])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player2,0)
      expect(@game.board.grid).to eq([['o','o','x'],[0,'x',0],['o',0,'x']])
      expect(@game.check_winner).to eq('No one wins, keep playing!')
      @game.write_onboard(@player1,5)
      expect(@game.board.grid).to eq([['o','o','x'],[0,'x','x'],['o',0,'x']])
      expect(@game.check_winner).to eq("#{@player1.name} wins!")
    end
  end

end



describe "Some failure scenarios:" do
  context "when the board doesn't exist" do
    # pending
    it "raises an error 'missing keyword: board'" do
      x = Player.new('x')
      o = Player.new('o')
      expect do
        game = Game.new(player1: x, player2: o)
      end.to raise_error("missing keyword: board")
    end
  end

  context "when the players do not exist" do
    # pending
    it "raises an error 'missing keywords: player1, player2'" do
      board = Board.new()
      expect do
        game = Game.new(board: board)
      end.to raise_error("missing keywords: player1, player2")
    end
  end

  context "when writing on the grid on a place that was used before" do
    # pending
    before do
      @player1 = Player.new('x')
      @player2 = Player.new('o')
      @board = Board.new
      @game = Game.new(player1: @player1, player2: @player2 , board: @board)
    end
    it "raise an error 'Position 4 has been already written at'" do
      @game.write_onboard(@player1,4)
      expect(@game.board.grid).to eq([[0,0,0],[0,'x',0],[0,0,0]])
      expect do
        @game.write_onboard(@player2,4)
        expect(@game.board.grid).to eq([[0,0,0],[0,'x',0],[0,0,0]])
      end.to raise_error('Position 4 has been already written at')
    end
  end
end
