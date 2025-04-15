# frozen_string_literal: true

RSpec.describe 'Smoke test' do
  it 'prints a message to confirm RSpec is working' do
    puts 'RSpec is running correctly!'
    expect(true).to eq(true)
  end
end
