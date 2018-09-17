# frozen_string_literal: true

require_relative 'board'
require_relative 'console/console_ui'

class Game
  attr_reader :board

  def initialize(player1, player2, board = Board.new, ui = ConsoleUi)
    @board = board
    @player1 = player1
    @player2 = player2
    @ui = ui
  end

  def start_game
    @ui.render_grid(@board.grid)
    until game_is_over?
      make_move(@player1)
      make_move(@player2) unless game_is_over?
    end
    @ui.game_over
  end

  def make_move(player)
    loop do
      # temp workaround to get piece before computer player changed
      piece = player == @player1 ? @player1.piece : @player2.piece
      valid_spots = @board.available_spots
      spot = player.get_spot(@board.grid, piece, @ui, valid_spots)
      break if @board.set_piece(spot, piece)
    end
    @ui.render_grid(@board.grid)
  end

  private

  def game_is_over?
    @board.winner? || @board.tie?
  end
end
