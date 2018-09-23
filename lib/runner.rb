# frozen_string_literal: true

require_relative 'player/player_factory'
require_relative 'game'
require_relative 'setup'

class Runner
  def initialize(setup = Setup.new)
    @players = setup.setup_players
  end

  def run
    Game.new(@players).start_game
  end
end

runner = Runner.new
runner.run
