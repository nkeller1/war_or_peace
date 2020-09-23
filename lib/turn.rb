class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = Array.new
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && (player1.deck.rank_of_card_at(2)) == player2.deck.rank_of_card_at(2))
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war.append(player1.deck.cards.shift)
      @spoils_of_war.append(player2.deck.cards.shift)
    elsif type == :war
      @spoils_of_war.append(player1.deck.cards.slice!(0..2))
      @spoils_of_war.append(player2.deck.cards.slice!(0..2))
      @spoils_of_war.flatten!
    elsif type == :mutually_assured_destruction
      player1.deck.cards.slice!(0..2)
      player2.deck.cards.slice!(0..2)
    end
  end

  def award_spoils(winner)
    if type == :mutually_assured_destruction
      @spoils_of_war = []
    else
      winner.deck.cards << @spoils_of_war
      winner.deck.cards.flatten!
    end
  end
end
