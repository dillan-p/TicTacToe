# frozen_string_literal: true

require_relative 'player/player_factory'
require_relative 'console/console_ui'

class Setup
  def initialize(ui = ConsoleUi)
    @ui = ui
  end

  def setup_players
    player_types = create_players
    player1, player2 = assign_player_pieces(player_types)
    set_player_order(player1, player2)
  end

  private

  def create_players
    @ui.game_type((1..3))
  end

  def assign_player_pieces(player_types)
    piece_choice = @ui.player_piece((1..2))
    PlayerFactory.create(player_types, piece_choice)
  end

  def set_player_order(player1, player2)
    player_order = @ui.player_order(player1, player2, (1..2))
    player_order == 2 ? [player2, player1] : [player1, player2]
  end
end
