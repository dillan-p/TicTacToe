# frozen_string_literal: true

require 'spec_helper'
require 'game'

RSpec.describe Game do
  let(:game) { described_class.new(computer, human) }
  let(:computer) { double }
  let(:human) { double }

  before do
    allow(human).to receive(:piece) { 'O' }
    allow(computer).to receive(:piece) { 'X' }
  end

  describe '#make_move' do
    subject { game.board }
    describe 'as a human' do
      before do
        allow(human).to receive(:get_spot).and_return(0, 0, 1)
      end

      context 'when spot is empty' do
        before { game.make_move(human) }
        it { is_expected.to eq(%w[O 1 2 3 4 5 6 7 8]) }
      end

      # context 'when spot isn\'t empty' do

      # end
    end

    describe 'as a computer' do
      before do
        allow(computer).to receive(:get_spot).and_return(4, 4, 2)
      end

      context 'when spot is empty' do
        before { game.make_move(computer) }
        it { is_expected.to eq(%w[0 1 2 3 X 5 6 7 8]) }
      end

      context 'when spot isn\'t empty' do
        before { 2.times { game.make_move(computer) } }
        it 'looks for another best move' do
          expect(computer).to have_received(:get_spot).exactly(3)
        end
      end
    end
  end
end
