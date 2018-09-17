# frozen_string_literal: true

require_relative 'player/player_factory'
require_relative 'console/console_ui'

class Setup
  attr_reader :player1, :player2

  def initialize(ui = ConsoleUi)
    @player1 = nil
    @player2 = nil
    @ui = ui
  end

  def setup_players
    create_players
    assign_player_pieces
    set_player_order
  end

  private

  def create_players
    game_type = @ui.game_type((1..3))
    @player1, @player2 = PlayerFactory.create(game_type)
  end

  def assign_player_pieces
    piece_choice = @ui.player_piece(@player1, @player2, (1..2))
    @player1.piece, @player2.piece = PlayerFactory.assign_pieces(piece_choice)
  end

  def set_player_order
    player_order = @ui.player_order(@player1, @player2, (1..2))
    puts player_order
    @player1, @player2 = @player2, @player1 if player_order == 2
  end
end
