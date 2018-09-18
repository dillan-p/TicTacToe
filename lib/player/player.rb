# frozen_string_literal: true

module Player
  attr_accessor :piece, :type

  def initialize(piece, type)
    @piece = piece
    @type = type
  end
end
