require_relative './lib/deck'
require_relative './lib/card'
require_relative './lib/player'
require_relative './lib/turn'

def create_deck
  suits = [:heart, :diamond, :club, :spade]
  ranks = (2..14).to_a

  cards = Array.new
  suits.each do |suit|
    ranks.each do |rank|
      if rank == 11
        value = "Jack"
      elsif rank == 12
        value = "Queen"
      elsif rank == 13
        value = "King"
      elsif rank == 14
        value = 'Ace'
      else
        value = rank.to_s
      end
      card = Card.new(suit, value, rank)
      cards << card
    end
  end
end


create_deck
