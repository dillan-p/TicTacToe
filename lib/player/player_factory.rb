# frozen_string_literal: true

require_relative 'human_player'
require_relative 'computer_player'

class PlayerFactory
  def self.create(game_type, piece_choice)
    player1_piece, player2_piece = assign_pieces(piece_choice)

    case game_type
    when 1
      [HumanPlayer.new(player1_piece), HumanPlayer.new(player2_piece)]
    when 2
      [HumanPlayer.new(player1_piece), ComputerPlayer.new(player2_piece)]
    when 3
      [ComputerPlayer.new(player1_piece), ComputerPlayer.new(player2_piece)]
    end
  end

  private_class_method def self.assign_pieces(piece_type)
    piece_type == 1 ? %w[O X] : %w[X O]
  end
end
