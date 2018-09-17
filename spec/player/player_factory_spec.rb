# frozen_string_literal: true

require 'spec_helper'
require 'player/player'
require 'player/human_player'
require 'player/computer_player'
require 'player/player_factory'

RSpec.describe PlayerFactory do
  describe '.create' do
    subject { PlayerFactory.create(game_type) }
    let(:game_type) { 1 }

    it { is_expected.to all(be_an(Player)) }

    context 'game type is 1' do
      it 'returns a human vs human' do
        all_human = subject.map { |i| i.singleton_class < HumanPlayer }
        expect(all_human).to all(be_truthy)
      end
    end

    context 'game type is 2' do
      let(:game_type) { 2 }
      it 'returns a human vs computer' do
        expect(subject[0].singleton_class < HumanPlayer).to eq(true)
        expect(subject[1].singleton_class < ComputerPlayer).to eq(true)
      end
    end

    context 'game type is 3' do
      let(:game_type) { 3 }
      it 'returns a computer vs computer' do
        all_computer = subject.map { |i| i.singleton_class < ComputerPlayer}
        expect(all_computer).to all(be_truthy)
      end
    end
  end

  describe '.assign_pieces' do
    subject { PlayerFactory.assign_pieces(piece_type) }

    context 'piece type is 1' do
      let(:piece_type) { 1 }
      it { is_expected.to eq(%w[O X]) }
    end

    context 'piece type is 2' do
      let(:piece_type) { 2 }
      it { is_expected.to eq(%w[X O]) }
    end
  end
end
