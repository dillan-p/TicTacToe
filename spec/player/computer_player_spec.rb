# frozen_string_literal: true

require 'spec_helper'
require 'player/computer_player'
require 'board'

RSpec.describe ComputerPlayer do
  let(:computer) { described_class.new('X') }
  let(:opponent_piece) { 'O' }

  describe '#get_spot' do
    subject { computer.get_spot(board, opponent_piece) }

    # context 'when next move is a horizontal winner for computer' do
    #   let(:board) { Board.new('X', %w[X X].fill(nil, 2, 7)) }

    #   it { is_expected.to eq(2) }
    # end

    # context 'when next move is a vertical winner for computer' do
    #   let(:board) { Board.new('X', ['X', nil, nil, 'X', nil, nil, nil, nil, nil]) }

    #   it { is_expected.to eq(6) }
    # end

    # context 'when next move is a diagonal winner for computer' do
    #   let(:board) { Board.new('X', ['X', nil, nil, nil, 'X', nil, nil, nil, nil]) }

    #   it { is_expected.to eq(8) }
    # end

    # context 'when next move is a horizontal winner for opponent' do
    #   let(:board) { Board.new('X', %w[O O].fill(nil, 2, 7)) }

    #   it { is_expected.to eq(2) }
    # end

    context 'when next move is a vertical winner for opponent' do
      let(:board) { Board.new('X', ['O', nil, nil, 'O', nil, nil, nil, nil, nil]) }

      it { is_expected.to eq(6) }
    end

    # context 'when next move is a diagonal winner for opponent' do
    #   let(:board) { Board.new('X', ['O', nil, nil, nil, 'O', nil, nil, nil, nil]) }

    #   it { is_expected.to eq(8) }
    # end
  end
end
