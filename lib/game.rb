require_relative '../lib/deck'
require_relative '../lib/card'
require_relative '../lib/player'
require_relative '../lib/turn'


class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def self.start(player1, player2)
    number = 1
    until player1.has_lost? || player2.has_lost? do
      turn = Turn.new(player1, player2)
      turn.pile_cards
      if turn.type == :basic
        puts "Turn #{number}: #{turn.winner.name} won #{turn.spoils_of_war.length} cards"
      elsif turn.type == :war
        puts "WAR - #{turn.winner.name} won #{turn.spoils_of_war.length} cards"
      elsif turn.type == :mutually_assured_destruction
        puts "*mutually assured destruction* 6 cards removed from play"
      end
      turn.award_spoils(turn.winner)
      number += 1
    end

    if player1.has_lost?
      puts "#{player2.name} has won the game!"
    else
      puts "#{player1.name} has won the game!"
    end
  end
end
