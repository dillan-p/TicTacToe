# frozen_string_literal: true

require 'spec_helper'
require 'player/human_player'

RSpec.describe HumanPlayer do
  let(:human_player) { HumanPlayer.new }

  describe '#get_move' do
    subject { human_player.get_spot }

    context 'when spot is valid' do
      before do
        allow(human_player).to receive(:gets).and_return('1')
      end

      it { is_expected.to eq(1) }
    end

    context 'when spot is invalid' do
      before do
        allow(human_player).to receive(:gets).and_return('a')
      end

      it 'throws an error' do
        expect { human_player.get_spot }.to raise_error(
          InvalidInputError,
          'a'
        )
      end
    end
  end
end
