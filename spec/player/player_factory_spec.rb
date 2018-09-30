# frozen_string_literal: true

require 'spec_helper'
require 'player/human_player'
require 'player/computer_player'
require 'player/player_factory'

RSpec.describe PlayerFactory do
  describe '.create' do
    subject { PlayerFactory.create(game_type, piece_type) }

    describe 'game type' do
      let(:piece_type) { 1 }

      context 'is 1' do
        let(:game_type) { 1 }
        it { is_expected.to all(be_a(HumanPlayer)) }
      end

      context 'is 2' do
        let(:game_type) { 2 }
        it 'returns a human vs computer' do
          expect(subject[0]).to be_a(HumanPlayer)
          expect(subject[1]).to be_a(ComputerPlayer)
        end
      end

      context 'is 3' do
        let(:game_type) { 3 }
        it { is_expected.to all(be_a(ComputerPlayer)) }
      end
    end

    describe 'piece type' do
      let(:game_type) { 1 }

      context 'piece type is 1' do
        let(:piece_type) { 1 }
        it 'sets the first player piece as O and the second player as X' do
          expect(subject[0].piece).to eq('O')
          expect(subject[1].piece).to eq('X')
        end
      end

      context 'piece type is 2' do
        let(:piece_type) { 2 }
        it 'sets the first player piece as X and the second player as O' do
          expect(subject[0].piece).to eq('X')
          expect(subject[1].piece).to eq('O')
        end
      end
    end
  end
end
