# frozen_string_literal: true

require_relative 'player'

class InvalidInputError < StandardError; end

class HumanPlayer
  include Player

  def initialize(piece)
    super(piece, :Human)
  end

  def get_spot(_board = nil, _piece = nil, ui, range)
    ui.choose_spot(range)
  end
end
