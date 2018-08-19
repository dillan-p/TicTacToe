# frozen_string_literal: true

require_relative 'player/computer_player'
require_relative 'player/human_player'

class Game
  attr_reader :board

  def initialize(com = ComputerPlayer.new, hum = HumanPlayer.new)
    @board = %w[0 1 2 3 4 5 6 7 8]
    @com = com
    @hum = hum
  end

  def start_game
    # start by printing the board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    puts 'Enter [0-8]:'
    # loop through until the game was won or tied
    until game_is_over(@board) || tie(@board)
      make_move(@hum)
      make_move(@com) if !game_is_over(@board) && !tie(@board)
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    end
    puts 'Game over'
  end

  def make_move(player)
    loop do
      spot = player.get_spot(@board, @hum.piece)
      break if set_piece(spot, player.piece)
    end
  end

  def game_is_over(b)
    [b[0], b[1], b[2]].uniq.length == 1 ||
      [b[3], b[4], b[5]].uniq.length == 1 ||
      [b[6], b[7], b[8]].uniq.length == 1 ||
      [b[0], b[3], b[6]].uniq.length == 1 ||
      [b[1], b[4], b[7]].uniq.length == 1 ||
      [b[2], b[5], b[8]].uniq.length == 1 ||
      [b[0], b[4], b[8]].uniq.length == 1 ||
      [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie(b)
    b.all? { |s| s == 'X' || s == 'O' }
  end

  private

  def set_piece(spot, piece)
    @board[spot] = piece unless spot_taken?(spot)
  end

  def spot_taken?(spot)
    %w[X O].include?(@board[spot])
  end
end

# game = Game.new
# game.start_game
