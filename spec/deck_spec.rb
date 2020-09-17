require_relative '../lib/deck'
require_relative '../lib/card'

RSpec.describe 'Deck' do
  it "exits" do
    deck = Deck.new

    expect(deck).to be
  end
end
