# frozen_string_literal: true

require_relative 'board'

class Game
  attr_reader :board

  def initialize(player1, player2, board = Board.new)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def start_game
    # start by printing the board
    puts " #{@board.grid[0]} | #{@board.grid[1]} | #{@board.grid[2]} \n===+===+===\n #{@board.grid[3]} | #{@board.grid[4]} | #{@board.grid[5]} \n===+===+===\n #{@board.grid[6]} | #{@board.grid[7]} | #{@board.grid[8]} \n"
    puts 'Enter [0-8]:'
    # loop through until the game was won or tied
    until game_is_over?
      make_move(@player1)
      make_move(@player2) unless game_is_over?
      puts " #{@board.grid[0]} | #{@board.grid[1]} | #{@board.grid[2]} \n===+===+===\n #{@board.grid[3]} | #{@board.grid[4]} | #{@board.grid[5]} \n===+===+===\n #{@board.grid[6]} | #{@board.grid[7]} | #{@board.grid[8]} \n"
    end
    puts 'Game over'
  end

  def make_move(player)
    loop do
      # temp workaround to get piece before computer player changed
      piece = player == @player1 ? @player1.piece : @player2.piece
      spot = player.get_spot(@board.grid, piece)
      break if @board.set_piece(spot, piece)
    end
  end

  private

  def game_is_over?
    @board.winner? || @board.tie?
  end
end
