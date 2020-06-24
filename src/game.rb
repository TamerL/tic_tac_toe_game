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
    diags = []
    diags << (0..2).collect {|i| @board.grid[i][i]}
    diags << (0..2).collect {|i| @board.grid.reverse[i][i]}
    array = (@board.grid + diags + @board.grid.transpose).find{ |arr| arr.uniq.length == 1 }
    if array && array.uniq.first != 0
      return "#{@player_marker[array.uniq.first].name} wins!"
    elsif @board.grid.find{ |arr| arr.include?(0)}
      return "No one wins, keep playing!"
    else
      return "The game is draw, no one wins!"
    end
  end
end
