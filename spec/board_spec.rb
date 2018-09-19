# frozen_string_literal: true

require 'spec_helper'
require 'board'

RSpec.describe Board do
  let(:board) { described_class.new(grid) }
  let(:grid) { Array.new(9) }

  describe '#set_piece' do
    subject { board.set_piece(0, 'X') }
    context 'when spot is free' do
      it { is_expected.to eq('X') }
    end

    context 'when spot is taken' do
      let(:grid) { ['X'].fill(nil, 1, 8) }
      it { is_expected.to eq(nil) }
    end
  end

  describe '#tie?' do
    subject { board.tie? }
    context 'when all spots are free' do
      it { is_expected.to eq(false) }
    end

    context 'when some spots are free' do
      let(:grid) { ['X'].fill(nil, 1, 8) }
      it { is_expected.to eq(false) }
    end

    context 'when no spots are free' do
      let(:grid) { %w[X X X X O O O O O] }
      it { is_expected.to eq(true) }
    end
  end

  describe '#winner?' do
    subject { board.winner? }
    context 'when there isn\'t a winner for an empty board' do
      it { is_expected.to eq(false) }
    end

    context 'when there isn\'t a winner for a non-empty board' do
      let(:grid) { ['X', 'X', 'O', 'O', nil, nil, nil, nil, nil] }
      it { is_expected.to eq(false) }
    end

    context 'when there is a winner' do
      let(:grid) { ['X', 'X', 'X'].fill(nil, 3, 6) }
      it { is_expected.to eq(true) }
    end
  end

  describe '#new_board' do
    let(:spot) { 0 }
    let(:piece) { 'X' }

    it 'returns a board' do
      expect(board.new_board(spot, piece)).to be_a(Board)
    end

    context 'when board is empty' do
      it 'sets a piece on the old board' do
        expect(board.new_board(spot, piece).grid).to eq(['X'].fill(nil, 1, 8))
      end
    end

    context 'when board isn\'t empty' do
      let(:grid) {
        [nil, 'X', 'O', nil, nil, nil, nil, nil, nil]
      }

      it 'sets a piece on the old board' do
        expect(board.new_board(spot, piece).grid).to eq(
          ['X', 'X', 'O', nil, nil, nil, nil, nil, nil]
        )
      end
    end
  end
end
