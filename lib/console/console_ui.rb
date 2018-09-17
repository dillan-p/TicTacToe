# frozen_string_literal: true

require_relative 'console_input'

class ConsoleUi
  extend ConsoleInput

  def self.game_type(value_range)
    puts 'Which game type would you like?'
    puts '1 - Human vs Human'
    puts '2 - Human vs Computer'
    puts '3 - Computer vs Computer'

    user_input(value_range)
  rescue InvalidInputError => e
    puts e.message
    retry
  end

  def self.player_piece(player1, player2, value_range)
    puts 'Which piece allocation would you like?'
    puts "1 - #{player1.type}: O, #{player2.type}: X"
    puts "2 - #{player1.type}: X, #{player2.type}: O"

    user_input(value_range)
  rescue InvalidInputError => e
    puts e.message
    retry
  end

  def self.player_order(player1, player2, value_range)
    puts 'Which player would you like to go first?'
    puts "1 - #{player1.type} (#{player1.piece})"
    puts "2 - #{player2.type} (#{player2.piece})"

    user_input(value_range)
  rescue InvalidInputError => e
    puts e.message
    retry
  end

  def self.choose_spot(value_range)
    puts 'Enter [0-8]:'

    user_input(value_range)
  rescue InvalidInputError => e
    puts e.message
    retry
  end

  def self.game_over
    puts 'Game Over!'
  end

  def self.render_grid(grid)
    puts  " #{grid[0]} | #{grid[1]} | #{grid[2]} "\
          "\n===+===+===\n"\
          " #{grid[3]} | #{grid[4]} | #{grid[5]} "\
          "\n===+===+===\n"\
          " #{grid[6]} | #{grid[7]} | #{grid[8]} \n"
  end
end
