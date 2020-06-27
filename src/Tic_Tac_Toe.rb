# frozen_string_literal: true

require './player'
require './board'
require './game'
require 'pry'

# running the Game:
def prepare_game
  puts "Welcome to Tic Tac Toe game :) \n\nPlayer1, please enter your name:"
  # asking for players names and creating players instances
  player1 = Player.new(gets.chomp)
  puts "Hi #{player1.name}\n\nPlayer2, please enter your name:"
  player2 = Player.new(gets.chomp)
  puts "Hi #{player2.name}\n\nStarting the game now, get ready!\n"
  @board = Board.new
  @game = Game.new(board: @board, player1: player1, player2: player2)
  # binding.pry
  @game.player_turn = player1
end

def run_game
  while @game.get_winner.nil? && @game.board.is_full? == false
    print_game
    # binding.pry
    puts "#{@game.player_turn.name} it's your turn! please select a position from 0 to #{Board::SIZE**2 - 1}"
    begin
      @game.write_onboard(@game.player_turn, gets.chomp.to_i)
    rescue StandardError => e
      puts e.message
    end
  end
  puts (@game.get_winner.nil? ? 'The game is draw, no one wins!' : "#{@game.get_winner.name} wins!").to_s
end

def print_game
  for line in (0...Board::SIZE) do
    print "\n|"
    for col in  (0...Board::SIZE) do
      print (@board.grid[line][col] == 0 ? " #{line*Board::SIZE + col} |" : " #{@board.grid[line][col]} |")
    end
    puts "\n" + "----" *  Board::SIZE + "\n"
  end
end

prepare_game
run_game
