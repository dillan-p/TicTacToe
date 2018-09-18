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
    player_types = create_players
    assign_player_pieces(player_types)
    set_player_order
  end

  private

  def create_players
    @ui.game_type((1..3))
  end

  def assign_player_pieces(player_types)
    piece_choice = @ui.player_piece((1..2))
    @player1, @player2 = PlayerFactory.create(player_types, piece_choice)
  end

  def set_player_order
    player_order = @ui.player_order(@player1, @player2, (1..2))
    @player1, @player2 = @player2, @player1 if player_order == 2
  end
end
