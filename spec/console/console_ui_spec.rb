# frozen_string_literal: true

require 'spec_helper'
require 'console/console_ui'
require 'console/console_input'

RSpec.describe ConsoleUi do
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
    subject { described_class.player_piece(range) }

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
        expect { described_class.player_piece(range) }
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
    let(:grid) { Array.new(9, 'X') }

    it 'prints the grid' do
      expect { described_class.render_grid(grid) }.to output(
        " X | X | X \n===+===+===\n X | X | X \n===+===+===\n X | X | X \n"
      ).to_stdout
    end

    context 'when there are empty grid items' do
      let(:grid) { Array.new(9) }
      it 'replaces empty items with a space' do
        expect { described_class.render_grid(grid) }.to output(
          " \s | \s | \s \n===+===+===\n \s | \s | \s \n===+===+===\n \s | \s | \s \n"
        ).to_stdout
      end
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
