# frozen_string_literal: true

require_relative 'player'

class HumanPlayer < Player
  def initialize(piece)
    super(piece, :Human)
  end

  def get_spot(_board = nil, depth, score, ui)
    ui.choose_spot((0..8))
  end
end
