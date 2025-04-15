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

    context 'when array is passed' do
      it 'should raise an ArgumentError' do
        expect { StringCalculator.add([]) }.to raise_error(ArgumentError)
      end
    end

    context 'when integer is passed' do
      it 'should raise an ArgumentError' do
        expect { StringCalculator.add(1) }.to raise_error(ArgumentError)
      end
    end

    context 'when single integer is passed' do
      it 'should return the integer' do
        expect(StringCalculator.add('1')).to eq(1)
      end
    end
  end
end
