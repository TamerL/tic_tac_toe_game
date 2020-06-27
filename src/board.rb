# frozen_string_literal: true

class Board
  attr_reader :grid

  SIZE = 3

  # def grid=(grid)
  #   @grid = grid
  # end
  #
  # def grid
  #   @grid
  # end

  def initialize
    @grid = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  end

  def write_onboard(str, pos)
    raise "Invalid position! please select from 0 to #{SIZE**2 - 1}" if pos >= SIZE**2
    #  A grid with size 3 will have positions from 0 to 8

    raise "Position #{pos} has been already written at" unless [0, nil].include?(@grid[pos / SIZE] [pos % SIZE])

    # Check the pos has something else than 0 or nil then it's already been written before

    @grid[pos / SIZE] [pos % SIZE] = str
    # Write on pos
  end

  def is_full?
    return false if grid.find { |arr| arr.include?(0) }

    # elsif the board still have a zero means still have empty place
    true
  end
end
