require_relative '../lib/deck'
require_relative '../lib/card'
require_relative '../lib/player'

RSpec.describe 'Player' do
  it "exists and has attributes" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Nathan', deck)

    expect(player).to be
    expect(player.name).to eq('Nathan')
    expect(player.deck).to eq(deck)
  end

  it ".has_lost?" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Nathan', deck)

    expect(player.has_lost?).to eq(false)

    player.deck.remove_card

    expect(player.has_lost?).to eq(false)

    player.deck.remove_card
    player.deck.remove_card

    expect(player.has_lost?).to eq(true)
  end

end
