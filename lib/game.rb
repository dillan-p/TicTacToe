# frozen_string_literal: true

require 'player/computer_player'

class Game
  attr_reader :board

  def initialize(com = ComputerPlayer.new)
    @board = %w[0 1 2 3 4 5 6 7 8]
    @com = com
    @hum = 'O' # the user's marker
  end

  def start_game
    # start by printing the board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    puts 'Enter [0-8]:'
    # loop through until the game was won or tied
    until game_is_over(@board) || tie(@board)
      get_human_spot
      eval_board(@com) if !game_is_over(@board) && !tie(@board)
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    end
    puts 'Game over'
  end

  def get_human_spot
    spot = nil
    until spot
      spot = gets.chomp.to_i
      if @board[spot] != 'X' && @board[spot] != 'O'
        @board[spot] = @hum
      else
        spot = nil
      end
    end
  end

  def eval_board(player)
    spot = nil
    until spot
      spot = player.get_spot(@board, player.piece)
      if @board[spot] != player.piece && @board[spot] != 'O'
        @board[spot] = player.piece
      else
        spot = nil
      end
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
end

# game = Game.new
# game.start_game
