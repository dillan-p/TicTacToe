# frozen_string_literal: true

require 'spec_helper'
require 'player/computer_player'
require 'board'

RSpec.describe ComputerPlayer do
  let(:computer) { described_class.new('X') }

  describe '#get_spot' do
    subject { computer.get_spot(board) }

    context 'when next move is a horizontal winner for computer' do
      let(:board) { Board.new('X', ['X', 'X', nil, 'O', nil, nil, 'O', nil, nil]) }

      it { is_expected.to eq(2) }
    end

    context 'when next move is a vertical winner for computer' do
      let(:board) { Board.new('X', ['X', 'O', 'O', 'X', nil, nil, nil, nil, nil]) }

      it { is_expected.to eq(6) }
    end

    context 'when next move is a diagonal winner for computer' do
      let(:board) { Board.new('X', ['X', 'O', 'O', nil, 'X', nil, nil, nil, nil]) }

      it { is_expected.to eq(8) }
    end

    context 'when next move is a horizontal winner for opponent' do
      let(:board) { Board.new('X', ['O', 'O', nil, nil, nil, nil, nil, nil, 'X']) }

      it { is_expected.to eq(2) }
    end

    context 'when next move is a vertical winner for opponent' do
      let(:board) { Board.new('X', ['O', 'X', nil, 'O', nil, nil, nil, nil, nil]) }

      it { is_expected.to eq(6) }
    end
  end
end
