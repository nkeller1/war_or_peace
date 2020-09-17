class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    cards[position].rank
  end

  def high_ranking_cards
    high_rank = Array.new
    @cards.each do |card|
      high_rank << card if card.rank >= 11
    end
    high_rank
  end

  def percent_high_ranking
    ((self.high_ranking_cards.length.to_f  / @cards.length) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
end
