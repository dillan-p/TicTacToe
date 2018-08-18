# frozen_string_literal: true

class InvalidInputError < StandardError; end

class HumanPlayer
  attr_reader :piece

  def initialize
    @piece = 'O'
  end

  def get_spot
    input = gets.chomp
    return input.to_i if (0..9).map(&:to_s).include?(input)
    raise InvalidInputError, input
  end
end
