# frozen_string_literal: true

require 'spec_helper'
require 'board'

RSpec.describe Board do
  let(:board) { described_class.new(piece, grid) }
  let(:grid) { Array.new(9) }
  let(:piece) { 'X' }

  describe '#set_piece' do
    context 'when spot is free' do
      it 'sets the piece' do
        expect(board.set_piece(0, 'X')).to eq('X')
      end

      it 'changes the active piece' do
        board.set_piece(0, 'X')
        expect(board.active_piece).to eq('O')
      end
    end

    context 'when spot is taken' do
      let(:grid) { ['X'].fill(nil, 1, 8) }

      it 'returns nil' do
        expect(board.set_piece(0, 'X')).to eq(nil)
      end
    end
  end

  describe '#full?' do
    subject { board.full? }
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

  describe '#win_for?' do
    let(:piece) { 'X' }
    subject { board.win_for?(piece) }

    context 'when there isn\'t a winner for an empty board' do
      it { is_expected.to eq(false) }
    end

    context 'when there isn\'t a winner for a non-empty board' do
      let(:grid) { ['X', 'X', 'O', 'O', nil, nil, nil, nil, nil] }
      it { is_expected.to eq(false) }
    end

    context 'when there is a horizontal winner' do
      let(:grid) { %w[X X X].fill(nil, 3, 6) }
      it { is_expected.to eq(true) }
    end

    context 'when there is a vertical winner' do
      let(:grid) { ['X', nil, nil, 'X', nil, nil, 'X', nil, nil] }
      it { is_expected.to eq(true) }
    end

    context 'when there is a diagonal winner' do
      let(:grid) { ['X', nil, nil, nil, 'X', nil, nil, nil, 'X'] }
      it { is_expected.to eq(true) }
    end
  end

  describe '#available_spots' do
    subject { board.available_spots }
    context 'when board is empty' do
      it { is_expected.to eq((0..8).to_a) }
    end

    context 'when board is full' do
      let(:grid) { Array.new(9, 'X') }

      it { is_expected.to eq([]) }
    end

    context 'when board is neither full nor empty' do
      let(:grid) { %w[X O].fill(nil, 2, 7) }

      it { is_expected.to eq((2..8).to_a) }
    end
  end

  describe '#reset_spot' do
    let(:grid) { ['X'].fill(nil, 1, 8) }
    it 'resets the spot to nil' do
      board.reset_spot(0)
      expect(board.grid).to eq(Array.new(9))
    end

    it 'changes the active piece' do
      board.reset_spot(0)
      expect(board.active_piece).to eq('O')
    end
  end
end
