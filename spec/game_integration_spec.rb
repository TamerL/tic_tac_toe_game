require 'rspec/autorun'
require './src/game'
require './src/player'


describe 'Running different game scenarios and checking the results' do
  before do
    @player1 = Player.new('x')
    @player2 = Player.new('o')
    @board = Board.new
    @game = Game.new(player1: @player1, player2: @player2 , board: @board)
  end

  context "1) Scenario #1: Player2 wins:" do
    pending
    it "returns array of 0's when the game start" do
      expect(@game.board.grid).to eq([[0,0,0],[0,0,0],[0,0,0]])
    end
    pending
    it "allow players to write to the grid, then returns 'Player 'O' wins!'" do
      expect(@game.board.grid).to eq([[0,0,0],[0,0,0],[0,0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player1.name,4)).to eq([[0,0,0],[0,'x',0],[0,0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player2.name,0)).to eq([['o',0,0],[0,'x',0],[0,0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player1.name,2)).to eq([['o',0,'x'],[0,'x',0],[0,0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player2.name,6)).to eq([['o',0,'x'],[0,'x',0],['o',0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player1.name,5)).to eq([['o',0,'x'],[0,'x','x'],['o',0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player2.name,3)).to eq([['o',0,'x'],['o','x','x'],['o',0,0]])
      expect(check_winner).to eq("Player '#{player2.name}' wins!")
    end
  end

  context "2) Scenario #2: The game is draw" do
    pending
    it "allow players to write to the grid, then returns 'This game is draw, no body wins!'" do
      expect(@game.write_onboard(@player1.name,0)).to eq([['x',0,0],[0,0,0],[0,0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player2.name,1)).to eq([['x','o',0],[0,0,0],[0,0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player1.name,7)).to eq([['x','o',0],[0,0,0],[0,'x',0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player2.name,4)).to eq([['x','o',0],[0,'o',0],[0,'x',0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player1.name,3)).to eq([['x','o',0],['x','o',0],[0,'x',0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player2.name,6)).to eq([['x','o',0],['x','o',0],['o','x',0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player1.name,2)).to eq([['x','o','x'],['x','o',0],['o','x',0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player2.name,5)).to eq([['x','o','x'],['x','o','o'],['o','x',0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player1.name,8)).to eq([['x','o','x'],['x','o','o'],['o','x','x']])
      expect(check_winner).to eq("This game is draw, no body wins!")
    end
  end

  context "3) Scenario #3: Player1 wins" do
    pending
    it "allow players to write to the grid, then returns 'This game is draw, no body wins!'" do
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player1.name,4)).to eq([[0,0,0],[0,'x',0],[0,0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player2.name,1)).to eq([[0,'o',0],[0,'x',0],[0,0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player1.name,2)).to eq([[0,'o','x'],[0,'x',0],[0,0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player2.name,6)).to eq([[0,'o','x'],[0,'x',0],['o',0,0]])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player1.name,8)).to eq([[0,'o','x'],[0,'x',0],['o',0,'x']])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player2.name,0)).to eq([['o','o','x'],[0,'x',0],['o',0,'x']])
      expect(check_winner).to eq('no winner so far, keep going!')
      expect(@game.write_onboard(@player1.name,0)).to eq([['o','o','x'],[0,'x','x'],['o',0,'x']])
      expect(check_winner).to eq("Player '#{player1.name}' wins!")
    end
  end

end



describe "Some failure scenarios:" do
  context "when the board doesn't exist" do
    pending
    it "raises an error 'No board was passed to the game'" do
      x = Player.new()
      o = Player.new()
      game = Game.new()
      expect do
        game.write_onboard(x,4)
      end.to raise_error("No board was passed to the game")
    end
  end

  context "when the players do not exist" do
    pending
    it "raises an error 'The game needs 2 players to start'" do
      board = Board.new()
      game = Game.new()
      expect do
        game.write_onboard(x,4)
      end.to raise_error("The game needs 2 players to be started")
    end
  end

  context "when writing on the grid on a place that was used before" do
    pending
    before do
      @player1 = Player.new('x')
      @player2 = Player.new('o')
      @board = Board.new
      @game = Game.new(player1: @player1, player2: @player2 , board: @board)
    end
    it "raise an error 'This place has been already written'" do
      expect(@game.write_onboard(@player1.name,4)).to eq([[0,0,0],[0,'x',0],[0,0,0]])
      expect do
        expect(@game.write_onboard(@player2.name,4)).to eq([[0,0,0],[0,'x',0],[0,0,0]])
      end.to raise_error('This place has been already written on')
    end
  end
end
