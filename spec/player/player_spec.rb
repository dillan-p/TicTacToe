# frozen_string_literal: true

require 'spec_helper'
require 'player/player'
require 'player/human_player'

RSpec.shared_examples 'a Human' do
  let(:human_player) { described_class.new.extend(HumanPlayer) }

  context 'type' do
    it 'should be :Human' do
      expect(human_player.type).to eq(:Human)
    end
  end
end

RSpec.describe Player do
  it_behaves_like 'a Human'
end
