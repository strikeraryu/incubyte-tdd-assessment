# frozen_string_literal: true

require './lib/string_calculator'

RSpec.describe StringCalculator do
  context 'smoke test' do
    it 'Rspec file is working' do
      expect(true).to eq(true)
    end
  end

  describe '.add' do
    context 'when empty string is passed' do
      it 'should return 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end
  end
end
