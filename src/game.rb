 class Game
   attr_accessor :board
   attr_reader :player1
   attr_reader :player2
   attr_reader :player_marker


  def initialize(board:, player1:, player2: )
    @player1 = player1
    @player2 = player2
    @board = board
    @player_marker = {'x' => player1, 'o' => player2}
  end

  def write_onboard(player, pos)
    # binding.pry
    @board.write_onboard(@player_marker.invert[player], pos)
  end

  def check_winner
    
  end
end
