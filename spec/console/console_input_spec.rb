# frozen_string_literal: true

require 'spec_helper'
require 'console/console_input'

RSpec.describe ConsoleInput do
  let(:instance) { Class.extend(ConsoleInput) }

  describe '#user_input' do
    let(:range) { (1..3) }
    subject { instance.user_input(range) }

    context 'when user input is in the valid range' do
      before do
        allow(instance).to receive(:gets) { '1' }
      end

      it { is_expected.to eq(1) }
    end

    context 'when user input is not in the valid range' do
      before do
        allow(instance).to receive(:gets) { '4' }
      end

      it 'throws an error' do
        expect { instance.user_input((1..3)) }.to raise_error(
          InvalidInputError,
          "\n4 is not a valid option\n\n"
        )
      end
    end
  end
end
