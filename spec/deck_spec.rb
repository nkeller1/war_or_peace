require_relative '../lib/deck'
require_relative '../lib/card'

RSpec.describe 'Deck' do
  it "exits" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck).to be
  end

  it "contains an array of cards, empty" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = []

    deck = Deck.new(cards)


    expect(deck.cards).to eq([])
  end

  it 'contains cards in an array' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck =  Deck.new(cards)

    expect(deck.cards).to eq([card1, card2, card3])
  end

  it "can verify the rank of a card at index position" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck =  Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "provides an array of cards that are high ranking, >= 11" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck =  Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1, card3])

    card4 = Card.new(:clubs, 'King', 13)

    cards << card4

    expect(deck.high_ranking_cards).to eq([card1, card3, card4])
  end

  it "calculates the percent of high ranking cards in the deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck =  Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it "can remove a card, .remove_card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck =  Deck.new(cards)

    expect(deck.cards).to eq(cards)

    deck.remove_card

    expect(deck.cards).to eq([card2, card3])

    deck.remove_card

    expect(deck.cards).to eq([card3])
  end
end
