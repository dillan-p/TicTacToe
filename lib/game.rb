# frozen_string_literal: true

require_relative 'board'
require_relative 'console/console_ui'

class Game
  attr_reader :board

  def initialize(player1, player2, board = Board.new, ui = ConsoleUi)
    @board = board
    @players = [player1, player2]
    @ui = ui
  end

  def start_game
    @ui.render_grid(@board.grid)
    until game_is_over?
      make_move(current_player)
      @players = @players.rotate
    end
    @ui.game_over
  end

  def make_move(player)
    loop do
      # temp workaround before computer player changed
      spot = player.get_spot(@board.grid, @players[1].piece, @ui, (0..8))
      break if @board.set_piece(spot, current_player.piece)
    end
    @ui.render_grid(@board.grid)
  end

  private

  def current_player
    @players[0]
  end

  def game_is_over?
    @board.winner? || @board.tie?
  end
end
