# encoding: UTF-8
# cards 4 of each suit or 4 of each
# 2, 3, 4, 5, 6, 7, 8, 9, 10, J=10, Q=10, K=10, A=11 or 1
# dealer stays >= 17

# c = {  'AC' => 1, '2C' => 2, '3C' => 3, '4C' => 4, '5C' => 5, '6C' => 6,
#        '7C' => 7, '8C' => 8, '9C' => 9, '10C' => 10, 'JC' => 10, 'QC' => 10,
#        'KC' => 10 }
# s = {  'AS' => 1, '2S' => 2, '3S' => 3, '4S' => 4, '5S' => 5, '6S' => 6,
#        '7S' => 7, '8S' => 8, '9S' => 9, '10S' => 10, 'JS' => 10, 'QS' => 10,
#        'KS' => 10 }
# d = {  'AD' => 1, '2D' => 2, '3D' => 3, '4D' => 4, '5D' => 5, '6D' => 6,
#        '7D' => 7, '8D' => 8, '9D' => 9, '10D' => 10, 'JD' => 10, 'QD' => 10,
#        'KD' => 10 }
# h = {  'AH' => 1, '2H' => 2, '3H' => 3, '4H' => 4, '5H' => 5, '6H' => 6,
#        '7H' => 7, '8H' => 8, '9H' => 9, '10H' => 10, 'JH' => 10, 'QH' => 10,
#        'KH' => 10 }
# deck = {}
# deck.merge!(c)
# deck.merge!(s)
# deck.merge!(d)
# deck.merge!(h)
# p deck

# puts 'Player, please enter your first name.'
# pname = gets.chomp.to_s
# puts 'Welcome ' + pname + ' to Blackjack where your money will soon be mine'
puts 'Enter your first wager.'
wager = gets.chomp.to_i
puts "That is $#{wager} down the drain."
# dealer_score = 0
# player_score = 0
# v = deck.values[0]
# p v
# player_score += v
# p player_score
# k, v = deck.first
# p k
# p v
# p deck[0]
# suits = ['C', 'S', 'D', 'H']
suits = %w(C, S, D, H)
# p suits
# cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
cards = %w(2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K)

deck = cards.product(suits)
deck.shuffle!

player_cards = []
dealer_cards = []

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

# player_score = calc_total(player_cards)
# dealer_score = calc_total(dealer_cards)

puts "Dealer has: #{dealer_cards[0]} and #{dealer_cards[1]}"
puts "Player has: #{player_cards[0]} and #{player_cards[1]}"
puts ''
puts 'Would you like to 1) hit or 2) stay?'
hit_or_stay = gets.chomp
p hit_or_stay