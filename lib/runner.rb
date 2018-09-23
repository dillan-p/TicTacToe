# frozen_string_literal: true

require_relative 'player/player_factory'
require_relative 'game'
require_relative 'setup'

class Runner
  def initialize(setup = Setup.new)
    @setup = setup
  end

  def run
    @setup.setup_players
    Game.new([@setup.player1, @setup.player2]).start_game
  end
end

runner = Runner.new
runner.run
