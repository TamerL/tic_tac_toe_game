 class Game
   attr_accessor :board
   attr_reader :player1
   attr_reader :player2

  def initialize(board: , player1: , player2: )
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def write_onboard(name,loc)
    @board.arr[loc % 3] [loc / 3] = name
    @board.arr
  end
end
