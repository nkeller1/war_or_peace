require_relative '../lib/deck'
require_relative '../lib/card'
require_relative '../lib/player'
require_relative '../lib/turn'


RSpec.describe Turn do
  before(:each) do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new('Nathan', @deck1)
    @player2 = Player.new('Jessa', @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  it "exists and has attributes" do
    expect(@turn).to be
    expect(@turn.player1).to be(@player1)
    expect(@turn.player2).to be(@player2)
    expect(@turn.spoils_of_war).to eq([])
  end

  it "determines if the turn is :basic" do
    expect(@turn.type).to eq(:basic)
  end

  it "determines a winner" do
    expect(@turn.winner).to eq(@player1)
  end

  it "sends the players cards for the turn to the spoils of war" do
    expect(@turn.spoils_of_war).to eq([])

    @turn.pile_cards

    expect(@turn.spoils_of_war).to eq([@card1, @card3])

    @turn.award_spoils(@turn.winner)

    expect(@turn.player2.deck.cards).to eq([@card4, @card6, @card7, @card1, @card3])
    expect(@turn.player1.deck.cards).to eq([@card2, @card5, @card8])
  end

  it "catches a war play type" do

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Nathan', deck1)
    player2 = Player.new('Jessa', deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:war)
    expect(turn.winner).to eq(player2)

    turn.pile_cards

    expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])

    turn.award_spoils(turn.winner)

    expect(player1.deck.cards.length).to eq(1)
    expect(player2.deck.cards.length).to eq(7)
    expect(player1.deck.cards).to eq([card8])
    expect(player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
  end

  it "catches mutually_assured_destruction" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Nathan', deck1)
    player2 = Player.new('Jessa', deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:mutually_assured_destruction)
    expect(turn.winner).to eq("No Winner")

    turn.pile_cards
    turn.spoils_of_war

    expect(turn.spoils_of_war).to eq([])
    expect(player1.deck.cards.length).to eq(1)
    expect(player2.deck.cards.length).to eq(1)
    expect(player1.deck.cards).to eq([card8])
    expect(player2.deck.cards).to eq([card7])
  end
end
