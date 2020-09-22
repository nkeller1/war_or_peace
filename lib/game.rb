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
    until player1.deck.empty? || player2.deck.empty? do
      number = 1
      turn = Turn.new(player1, player2)
      require "pry"; binding.pry
      puts "Turn #{number}: #{player1} won 2 cards"

      number += 1
    end
  end

end
