require_relative '../lib/card'

RSpec.describe Card, type: :model do
  it "creates a new card" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card).to be
  end

  it "has attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end
end
