# frozen_string_literal: true

require 'spec_helper'
require 'player/human_player'
require 'player/computer_player'
require 'player/player'
require 'setup'

RSpec.describe Setup do
  let(:setup) { described_class.new }
  let(:factory) { double('factory') }

  describe '#setup_players' do
    describe 'for a chosen game type' do
      before do
        allow(factory).to receive(:create) {
          [Player.new.extend(HumanPlayer), Player.new.extend(HumanPlayer)]
        }
      end

      describe 'with a chosen piece type' do
        before do
          allow(factory).to receive(:assign_pieces) { %w[O X] }
        end

        context 'when player order is 1' do
          before do
            allow(setup).to receive(:gets) { '1' }
            setup.setup_players
          end

          it 'doesn\'t change the order' do
            players = [setup.player1, setup.player2]
            expect(players[0].piece).to eq('O')
            expect(players[1].piece).to eq('X')
          end
        end

        context 'when player order is 2' do
          before do
            allow(setup).to receive(:gets).and_return('1', '1', '2')
            setup.setup_players
          end

          it 'changes the order' do
            players = [setup.player1, setup.player2]
            expect(players[0].piece).to eq('X')
            expect(players[1].piece).to eq('O')
          end
        end
      end
    end
  end
end
