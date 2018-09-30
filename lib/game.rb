# frozen_string_literal: true

require_relative 'board'
require_relative 'console/console_ui'

class Game
  attr_reader :board

  def initialize(players, board = Board.new(players[0].piece), ui = ConsoleUi)
    @board = board
    @players = players
    @ui = ui
  end

  def start_game
    @ui.render_grid(@board.grid)
    until game_is_over?
      make_move
      @players = @players.rotate
    end
    @ui.game_over
  end

  def make_move
    loop do
      spot = current_player.get_spot(@board, 0, {}, @ui)
      break if @board.set_piece(spot, current_player.piece)
    end
    @ui.render_grid(@board.grid)
  end

  private

  def current_player
    @players[0]
  end

  def next_player
    @players[1]
  end

  def game_is_over?
    # just calculate winner for the last players turn (which is the next player)
    @board.win_for?(next_player.piece) || @board.full?
  end
end
