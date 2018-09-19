# frozen_string_literal: true

class Player
  attr_reader :piece, :type

  def initialize(piece, type)
    @piece = piece
    @type = type
  end
end
