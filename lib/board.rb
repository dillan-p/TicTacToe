# frozen_string_literal: true

class Board
  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze

  attr_reader :grid

  def initialize
    @grid = Array.new(9)
  end

  def set_piece(spot, piece)
    @grid[spot] = piece unless spot_taken?(spot)
  end

  def tie?
    @grid.all? { |s| %w[X O].include?(s) }
  end

  def winner?
    WINNING_COMBINATIONS.each do |a, b, c|
      return @grid[a] == @grid[b] &&
             @grid[a] == @grid[c] &&
             !@grid[a].nil?
    end
  end

  private

  def spot_taken?(spot)
    %w[X O].include?(@grid[spot])
  end
end
