# encoding: UTF-8
def calc_total(cards)
  # [['2', 'S'], ['A', 'H']] <== like my representation reversed
  arr = cards.map { |e| e[0] }
  
  total = 0
  arr.each do |value|
    if value == 'A'
      total += 11
    elsif value.to_i == 0 # J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  # Ace correction when valuel > 21
  arr.select { |e| e == 'A'}.count.times do
    total -= 10 if total > 21
  end

  total
end


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
# puts 'Enter your first wager.'
# wager = gets.chomp.to_i
# puts "#{pname} kiss that $#{wager} away!"
dealer_score = 0
player_score = 0
hit_or_stay = ''
# accum = 0
# v = deck.values[0]
# p v
# player_score += v
# p player_score
# k, v = deck.first
# p k
# p v
# p deck[0]
suits = ['C', 'S', 'D', 'H']
# suits = %w('C', 'S', 'D', 'H')
# p suits
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
# cards = %w('2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A')

deck = cards.product(suits)
deck.shuffle!
# p deck 
player_cards = []
dealer_cards = []

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

# player_score = calc_total(player_cards)
# dealer_score = calc_total(dealer_cards)

# p hit_or_stay
# p player_cards[0].first
# p calc_total
# player_score += calc_total(player_cards[0].first.to_i)
# player_score += calc_total(player_cards[1].first.to_i)
# dealer_score += calc_total(dealer_score[0].first.to_i)
# dealer_score += calc_total(dealer_score[1].first.to_i)
player_score = calc_total(player_cards)
# player_score += calc_total(player_cards[1].first.to_i)
dealer_score = calc_total(dealer_cards)
# dealer_score += calc_total(dealer_score[1].first.to_i)
puts "Dealer has: #{dealer_cards[0]} and #{dealer_cards[1]}, for a total of #{dealer_score}"
if dealer_score >= 17
  puts "Dealer Stays"
end
if dealer_score == 21
  puts "Dealer has won"
end
# puts "#{pname} has: #{player_cards[0]} and #{player_cards[1]}"
puts "Player has: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_score}"
puts ''
# puts 'Would you like to 1) hit or 2) stay?'
until hit_or_stay == '2'
  puts "Player has: #{player_cards} , for a total of #{player_score}"
  if player_score > 21 
    puts "Player has lost"
    break
  end
  puts 'Would you like to 1) hit or 2) stay?'
  hit_or_stay = gets.chomp
  if hit_or_stay == '2'
    break
  end
  player_cards << deck.pop
  p player_cards
  player_score = calc_total(player_cards)
end
if player_score > dealer_score && player_score <= 21
  puts "Player wins!"
elsif dealer_score > player_score && dealer_score <=21
  puts "Dealer Wins!"
else
  puts "Player Wins"
end
