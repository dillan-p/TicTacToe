# frozen_string_literal: true

require 'spec_helper'
require 'player/human_player'
require 'player/computer_player'
require 'player/player'
require 'console/console_ui'
require 'setup'

RSpec.describe Setup do
  let(:setup) { described_class.new(ui) }
  let(:ui) { double }

  describe '#setup_players' do
    describe 'for a chosen game type with a chosen piece type' do
      before do
        allow(PlayerFactory).to receive(:create) {
          [HumanPlayer.new('O'), HumanPlayer.new('X')]
        }
        allow(ui).to receive(:game_type) { 1 }
        allow(ui).to receive(:player_piece) { 1 }
      end

      context 'when player order is 1' do
        before do
          allow(PlayerFactory).to receive(:assign_pieces) { %w[O X] }
          allow(ui).to receive(:player_order) { 1 }
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
          allow(ui).to receive(:player_order) { 2 }
          setup.setup_players
        end

        it 'does change the order' do
          players = [setup.player1, setup.player2]
          expect(players[0].piece).to eq('X')
          expect(players[1].piece).to eq('O')
        end
      end
    end
  end
end
