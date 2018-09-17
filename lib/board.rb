# frozen_string_literal: true

class Board
  attr_reader :grid

  def initialize
    @grid = %w[0 1 2 3 4 5 6 7 8]
  end

  def set_piece(spot, piece)
    @grid[spot] = piece unless spot_taken?(spot)
  end

  def tie?
    @grid.all? { |s| %w[X O].include?(s) }
  end

  def winner?
    b = @grid
    [b[0], b[1], b[2]].uniq.length == 1 ||
      [b[3], b[4], b[5]].uniq.length == 1 ||
      [b[6], b[7], b[8]].uniq.length == 1 ||
      [b[0], b[3], b[6]].uniq.length == 1 ||
      [b[1], b[4], b[7]].uniq.length == 1 ||
      [b[2], b[5], b[8]].uniq.length == 1 ||
      [b[0], b[4], b[8]].uniq.length == 1 ||
      [b[2], b[4], b[6]].uniq.length == 1
  end

  def available_spots
    @grid.reject { |i| %w[X O].include?(i) }
  end

  private

  def spot_taken?(spot)
    %w[X O].include?(@grid[spot])
  end
end
