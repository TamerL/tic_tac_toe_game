class Board
  attr_reader :grid

  SIZE = 3

  def initialize
    @grid = [[0,0,0],[0,0,0],[0,0,0]]
  end

  def write_onboard(str,pos)
    raise "Invalid position! please select from 0 to #{SIZE**2 - 1}" if pos >= SIZE**2
    raise "Position #{pos} has been already written at" if @grid[pos % SIZE] [pos / SIZE] != 0
    @grid[pos % SIZE] [pos / SIZE] = str
  end
end
