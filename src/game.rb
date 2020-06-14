 class Game
   attr_accessor :board
   attr_reader :player1
   attr_reader :player2
   attr_reader :player_marker


  def initialize(board: , player1: , player2: )
    @player1 = player1
    @player2 = player2
    @board = board
    @player_marker = {player1: 'x', player2: 'o'}
  end

  def write_onboard(player,loc)
    # binding.pry
    board.grid[loc % 3] [loc / 3] = player_marker[player.to_sym]
  end
end
