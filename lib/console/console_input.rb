# frozen_string_literal: true

class InvalidInputError < StandardError; end

module ConsoleInput
  def user_input(valid_range)
    print 'Choice: '
    input = gets.chomp
    return input.to_i if valid_range.map(&:to_s).include?(input)
    raise InvalidInputError.new("\n#{input} is not a valid option\n\n")
  end
end
