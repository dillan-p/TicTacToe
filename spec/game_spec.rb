# frozen_string_literal: true

require 'spec_helper'
require 'game'

RSpec.describe Game do
  let(:game) { described_class.new(players, board) }
  let(:players) { [human, computer] }
  let(:computer) { double }
  let(:human) { double }
  let(:board) { Board.new('X', grid) }

  before do
    allow(human).to receive(:piece) { 'O' }
    allow(computer).to receive(:piece) { 'X' }
  end

  describe '#make_move' do
    describe 'as a human' do
      context 'when spot is empty' do
        let(:grid) { Array.new(9) }
        before do
          allow(human).to receive(:get_spot).and_return(0)
          game.make_move
        end
        it 'makes the move' do
          expect(human).to have_received(:get_spot).exactly(1)
          expect(board.grid).to eq(['O'].fill(nil, 1, 8))
        end
      end

      context 'when spot isn\'t empty' do
        let(:grid) { ['X'].fill(nil, 1, 8) }
        before do
          allow(human).to receive(:get_spot).and_return(0, 1)
          game.make_move
        end
        it 'makes the move' do
          expect(human).to have_received(:get_spot).exactly(2)
          expect(board.grid).to eq(%w[X O].fill(nil, 2, 7))
        end
      end
    end

    describe 'as a computer' do
      let(:players) { [computer, human] }
      context 'when spot is empty' do
        let(:grid) { Array.new(9) }
        before do
          allow(computer).to receive(:get_spot).and_return(0)
          game.make_move
        end
        it 'makes the move' do
          expect(computer).to have_received(:get_spot).exactly(1)
          expect(board.grid).to eq(['X'].fill(nil, 1, 8))
        end
      end

      context 'when spot isn\'t empty' do
        let(:grid) { ['O'].fill(nil, 1, 8) }
        before do
          allow(computer).to receive(:get_spot).and_return(0, 1)
          game.make_move
        end
        it 'makes the move' do
          expect(computer).to have_received(:get_spot).exactly(2)
          expect(board.grid).to eq(%w[O X].fill(nil, 2, 7))
        end
      end
    end
  end
end
