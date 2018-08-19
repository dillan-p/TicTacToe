# frozen_string_literal: true

require_relative 'player/computer_player'
require_relative 'player/human_player'
require_relative 'board'

class Game
  attr_reader :board

  def initialize(
    com = ComputerPlayer.new,
    hum = HumanPlayer.new,
    board = Board.new
  )
    @board = board
    @com = com
    @hum = hum
  end

  def start_game
    # start by printing the board
    puts " #{@board.grid[0]} | #{@board.grid[1]} | #{@board.grid[2]} \n===+===+===\n #{@board.grid[3]} | #{@board.grid[4]} | #{@board.grid[5]} \n===+===+===\n #{@board.grid[6]} | #{@board.grid[7]} | #{@board.grid[8]} \n"
    puts 'Enter [0-8]:'
    # loop through until the game was won or tied
    until game_is_over?
      make_move(@hum)
      make_move(@com) unless game_is_over?
      puts " #{@board.grid[0]} | #{@board.grid[1]} | #{@board.grid[2]} \n===+===+===\n #{@board.grid[3]} | #{@board.grid[4]} | #{@board.grid[5]} \n===+===+===\n #{@board.grid[6]} | #{@board.grid[7]} | #{@board.grid[8]} \n"
    end
    puts 'Game over'
  end

  def make_move(player)
    loop do
      spot = player.get_spot(@board.grid, @hum.piece)
      break if @board.set_piece(spot, player.piece)
    end
  end

  private

  def game_is_over?
    @board.winner? || @board.tie?
  end
end

# game = Game.new
# game.start_game
