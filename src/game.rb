# frozen_string_literal: true

class Game
  attr_accessor :board
  attr_reader :player1
  attr_reader :player2
  attr_reader :player_marker
  attr_accessor :player_turn

  def initialize(board:, player1:, player2:)
    @player1 = player1
    @player2 = player2
    @board = board
    @player_marker = { 'x' => player1, 'o' => player2 }
  end

  def write_onboard(player, pos)
    board.write_onboard(@player_marker.invert[player], pos)
    # binding.pry
    @player_turn = @player_marker.reject { |_k, v| v == player }.values.first
  end

  def get_winner
    diags = []
    diags << (0..2).collect { |i| board.grid[i][i] }
    # checking in the diagonal \ for a winner

    diags << (0..2).collect { |i| board.grid.reverse[i][i] }
    # checking in the diagonal / for a winner

    array = (board.grid + diags + board.grid.transpose).find { |arr| arr.uniq.length == 1 }
    # checking for a winner in the columns and lines, #{array} will have
    # a sequence of 3 identical elements

    if array && array.uniq.first != 0
      # if array exists and is not full of zeros, then there is a winner
      @player_marker[array.uniq.first]
    else
      # else the game is draw
      # 'The game is draw, no one wins!'
      nil
    end
  end
end
