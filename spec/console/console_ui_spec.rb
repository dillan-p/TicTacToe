# frozen_string_literal: true

require 'spec_helper'
require 'console/console_ui'
require 'console/console_input'

RSpec.describe ConsoleUi do
  let(:player1) { double(:player1, type: 'X') }
  let(:player2) { double(:player2, type: 'O') }

  let(:range) { (1..1) }

  describe '#game_type' do
    subject { described_class.game_type(range) }

    context 'when input is valid' do
      before do
        allow(described_class).to receive(:gets) { '1' }
      end

      it { is_expected.to eq(1) }
    end

    context 'when input is invalid' do
      before do
        allow(described_class).to receive(:user_input)
          .and_raise(InvalidInputError).and_return('1')
      end

      it 'doesn\'t throw an error' do
        expect { described_class.game_type(range) }.to_not raise_error
      end
    end
  end

  describe '#player_piece' do
    subject { described_class.player_piece(player1, player2, range) }

    context 'when input is valid' do
      before do
        allow(described_class).to receive(:gets) { '1' }
      end

      it { is_expected.to eq(1) }
    end

    context 'when input is invalid' do
      before do
        allow(described_class).to receive(:user_input)
          .and_raise(InvalidInputError).and_return('1')
      end

      it 'doesn\'t throw an error' do
        expect { described_class.player_piece(player1, player2, range) }
          .to_not raise_error
      end
    end
  end

  describe '#choose_spot' do
    subject { described_class.choose_spot(range) }

    context 'when input is valid' do
      before do
        allow(described_class).to receive(:gets) { '1' }
      end

      it { is_expected.to eq(1) }
    end

    context 'when input is invalid' do
      before do
        allow(described_class).to receive(:user_input)
          .and_raise(InvalidInputError).and_return('1')
      end

      it 'doesn\'t throws an error' do
        expect { described_class.choose_spot(range) }.to_not raise_error
      end
    end
  end

  describe '#render_grid' do
    let(:grid) { %w[0 1 2 3 4 5 6 7 8 9] }

    it 'print the grid' do
      expect { described_class.render_grid(grid) }.to output(
        " 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n"
      ).to_stdout
    end
  end

  describe '#game_over' do
    it 'prints the game is finished' do
      expect { described_class.game_over }.to output(
        "Game Over!\n"
      ).to_stdout
    end
  end
end
