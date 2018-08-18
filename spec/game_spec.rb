# frozen_string_literal: true

require 'spec_helper'
require 'game'

RSpec.describe Game do
  let(:game) { Game.new }

  describe '#get_human_spot' do
    subject { game.board }
    before do
      allow(game).to receive(:gets).and_return('0', '0', '1')
    end

    context 'when spot is empty' do
      before { game.get_human_spot }
      it { is_expected.to eq(%w[O 1 2 3 4 5 6 7 8]) }
    end

    context 'when spot isn\'t empty' do
      before { 2.times { game.get_human_spot } }
      it 'asks for input again' do
        expect(game).to have_received(:gets).exactly(3)
      end
    end
  end

  describe '#eval_board' do
    subject { game.board }
    before do
      allow_any_instance_of(Game)
        .to receive(:get_best_move)
        .and_return(4, 4, 2)
    end

    context 'when spot is empty' do
      before { game.eval_board }
      it { is_expected.to eq(%w[0 1 2 3 X 5 6 7 8]) }
    end

    context 'when spot isn\'t empty' do
      before { 2.times { game.eval_board } }
      it 'looks for another best move' do
        expect(game).to have_received(:get_best_move).exactly(3)
      end
    end
  end
end
