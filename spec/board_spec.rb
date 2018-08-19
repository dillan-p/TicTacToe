# frozen_string_literal: true

require 'spec_helper'
require 'board'

RSpec.describe Board do
  let(:board) { described_class.new }

  describe '#set_piece' do
    subject { board.set_piece(0, 'X') }
    context 'when spot is free' do
      it { is_expected.to eq('X') }
    end

    context 'when spot is taken' do
      before { board.set_piece(0, 'O') }
      it { is_expected.to eq(nil) }
    end
  end

  describe '#tie?' do
    subject { board.tie? }
    context 'when all spots are free' do
      it { is_expected.to eq(false) }
    end

    context 'when some spots are free' do
      before { board.set_piece(0, 'X') }
      it { is_expected.to eq(false) }
    end

    context 'when no spots are free' do
      before do
        (0..4).each { |i| board.set_piece(i, 'X') }
        (5..8).each { |i| board.set_piece(i, 'O') }
      end
      it { is_expected.to eq(true) }
    end
  end

  describe '#winner?' do
    subject { board.winner? }
    context 'when there isn\'t a winner' do
      it { is_expected.to eq(false) }
    end

    context 'when there is a winner' do
      before do
        3.times { |i| board.set_piece(i, 'X') }
      end
      it { is_expected.to eq(true) }
    end
  end
end
