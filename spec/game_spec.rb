# frozen_string_literal: true

require 'spec_helper'
require 'game'

RSpec.describe Game do
  let(:game) { described_class.new(computer, human, board) }
  let(:computer) { double }
  let(:human) { double }
  let(:board) { double }

  before do
    allow(human).to receive(:piece) { 'O' }
    allow(computer).to receive(:piece) { 'X' }
    allow(board).to receive(:grid) { [] }
  end

  describe '#start_game' do
    context 'when there is a winner' do
      before do
        allow(board).to receive(:winner?).and_return(true)
      end
      it 'won\'t call make_move' do
        expect(game).to receive(:make_move).exactly(0)
      end
    end

    context 'when there is a tie' do
      before do
        allow(board).to receive(:tie?).and_return(true)
      end
      it 'won\'t call make_move' do
        expect(game).to receive(:make_move).exactly(0)
      end
    end
  end

  describe '#make_move' do
    describe 'as a human' do
      before do
        allow(human).to receive(:get_spot).and_return(0, 0, 1)
      end

      context 'when spot is empty' do
        before do
          allow(board).to receive(:set_piece) { 'X' }
          game.make_move(human)
        end
        it 'makes the move' do
          expect(human).to have_received(:get_spot).exactly(1)
        end
      end

      context 'when spot isn\'t empty' do
        before do
          allow(board).to receive(:set_piece).and_return('X', nil, 'X')
          2.times { game.make_move(human) }
        end
        it 'makes the move' do
          expect(human).to have_received(:get_spot).exactly(3)
        end
      end
    end

    describe 'as a computer' do
      before do
        allow(computer).to receive(:get_spot).and_return(4, 4, 2)
      end

      context 'when spot is empty' do
        before do
          allow(board).to receive(:set_piece) { 'X' }
          game.make_move(computer)
        end
        it 'makes the move' do
          expect(computer).to have_received(:get_spot).exactly(1)
        end
      end

      context 'when spot isn\'t empty' do
        before do
          allow(board).to receive(:set_piece).and_return('X', nil, 'X')
          2.times { game.make_move(computer) }
        end
        it 'looks for another best move' do
          expect(computer).to have_received(:get_spot).exactly(3)
        end
      end
    end
  end
end
