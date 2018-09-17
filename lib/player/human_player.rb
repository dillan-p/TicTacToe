# frozen_string_literal: true

class InvalidInputError < StandardError; end

module HumanPlayer
  def self.extended(mod)
    mod.type = :Human
  end

  def get_spot(_board = nil, _piece = nil)
    input = gets.chomp
    return input.to_i if (0..9).map(&:to_s).include?(input)
    raise InvalidInputError, input
  end
end
