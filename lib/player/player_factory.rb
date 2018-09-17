# frozen_string_literal: true

require_relative 'player'
require_relative 'human_player'
require_relative 'computer_player'

class PlayerFactory
  def self.create(game_type)
    case game_type
    when 1
      [Player.new.extend(HumanPlayer), Player.new.extend(HumanPlayer)]
    when 2
      [Player.new.extend(HumanPlayer), Player.new.extend(ComputerPlayer)]
    when 3
      [Player.new.extend(ComputerPlayer), Player.new.extend(ComputerPlayer)]
    end
  end

  def self.assign_pieces(piece_type)
    piece_type == 1 ? %w[O X] : %w[X O]
  end
end
