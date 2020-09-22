require_relative './lib/deck'
require_relative './lib/card'
require_relative './lib/player'
require_relative './lib/turn'
require_relative './lib/game'

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
    cards
  end

  def shuffle_and_hand_out_cards
    cards = create_deck
    cards.shuffle!
    divide = cards.each_slice(26).to_a
    deck1 = divide[0]
    deck2 = divide[1]
    @player1 = Player.new('Nathan', deck1)
    @player2 = Player.new('Jessa', deck2)
  end

puts "Welcome to War! (or Peace) This game will be played with 52 cards."
shuffle_and_hand_out_cards
puts "The players today are #{@player1.name} and #{@player2.name}"
puts "Type 'GO' to start the game!"
puts '-----------------------------------------------------------------'
input = gets.chomp
if input.downcase != "go"
  puts 'Thank you for playing!'
else
  Game.start(@player1, @player2)
end
