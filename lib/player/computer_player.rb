# frozen_string_literal: true

require_relative 'player'

class ComputerPlayer < Player
  def initialize(piece)
    super(piece, :Computer)
  end

  def get_spot(board, opponent_piece, depth = 0, scores = {}, _ui = nil)
    return 10 - depth if board.win_for?(@piece)
    return depth - 10 if board.win_for?(opponent_piece)
    return 0 if board.full?

    board.available_spots.each do |spot|
      board.set_piece(spot, board.active_piece)
      scores[spot] = get_spot(board, opponent_piece, depth += 1, {})
      puts spot if depth == 0
      board.reset_spot(spot)
    end

    if depth == board.available_spots.length
      return scores.max_by { |_move, result| result }[0]
    end

    if board.active_piece == @piece
      scores.max_by { |_move, result| result }[1]
    else
      scores.min_by { |_move, result| result }[1]
    end
  end
end
