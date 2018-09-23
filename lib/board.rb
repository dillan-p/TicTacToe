# frozen_string_literal: true

class Board
  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze

  attr_reader :grid, :active_piece

  def initialize(piece, grid = nil)
    @active_piece = piece
    @grid = grid || Array.new(9)
  end

  def set_piece(spot, piece)
    return if spot_taken?(spot)
    change_active_piece
    @grid[spot] = piece
  end

  def full?
    !@grid.include?(nil)
  end

  def win_for?(piece)
    WINNING_COMBINATIONS.any? do |a, b, c|
      @grid[a] == piece &&
        @grid[b] == piece &&
        @grid[c] == piece
    end
  end

  def available_spots
    @grid.each_index.select { |i| @grid[i].nil? }
  end

  def reset_spot(spot)
    @grid[spot] = nil
    change_active_piece
  end

  private

  def spot_taken?(spot)
    %w[X O].include?(@grid[spot])
  end

  def change_active_piece
    @active_piece = @active_piece == 'O' ? 'X' : 'O'
  end
end
