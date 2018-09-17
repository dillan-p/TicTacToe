# frozen_string_literal: true

require 'spec_helper'
require 'player/player'
require 'player/human_player'

RSpec.shared_examples 'a Human' do
  let(:human_player) { described_class.new.extend(HumanPlayer) }

  context 'type' do
    it 'should be :Human' do
      expect(human_player.type).to eq(:Human)
    end
  end

  describe '#get_spot' do
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

RSpec.describe Player do
  it_behaves_like 'a Human'
end
