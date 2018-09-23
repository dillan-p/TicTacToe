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
end
