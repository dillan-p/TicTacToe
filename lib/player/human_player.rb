# frozen_string_literal: true

class InvalidInputError < StandardError; end

module HumanPlayer
  def self.extended(mod)
    mod.type = :Human
  end

  def get_spot(_board = nil, _piece = nil, ui, range)
    ui.choose_spot(range)
  end
end
