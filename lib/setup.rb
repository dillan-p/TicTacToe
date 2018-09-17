# frozen_string_literal: true

require_relative 'player/player_factory'

class Setup
  attr_reader :player1, :player2

  def initialize(factory = PlayerFactory)
    @player1 = nil
    @player2 = nil
    @factory = factory
  end

  def setup_players
    create_players
    assign_player_pieces
    set_player_order
  end

  private

  def create_players
    game_type = console_game_type
    @player1, @player2 = @factory.create(game_type)
  end

  def assign_player_pieces
    piece_choice = console_player_piece
    @player1.piece, @player2.piece = @factory.assign_pieces(piece_choice)
  end

  def set_player_order
    player_order = console_player_order
    @player1, @player2 = @player2, @player1 if player_order == 2
  end

  def console_game_type
    puts 'Which game type would you like?'
    puts '1 - Human vs Human'
    puts '2 - Human vs Computer'
    puts '3 - Computer vs Computer'

    game_type = gets.chomp
    game_type.to_i
  end

  def console_player_piece
    puts 'Which piece allocation would you like?'
    puts "1 - #{@player1.type}: O, #{@player2.type}: X"
    puts "2 - #{@player1.type}: X, #{@player2.type}: O"

    piece_type = gets.chomp
    piece_type.to_i
  end

  def console_player_order
    puts 'Which player would you like to go first?'
    puts "1 - #{@player1.type} (#{@player1.piece})"
    puts "2 - #{@player2.type} (#{@player2.piece})"

    player_order = gets.chomp
    player_order.to_i
  end
end
