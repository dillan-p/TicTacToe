# frozen_string_literal: true

require_relative 'player/player_factory'
require_relative 'game'
require_relative 'setup'

class Runner
  def initialize(players = Setup.new)
    @players = players
  end

  def run
    @players.setup_players
    Game.new(@players.player1, @players.player2).start_game
  end
end

runner = Runner.new
runner.run
