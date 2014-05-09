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

puts 'Player, please enter your first name.'
pname = gets.chomp.to_s
puts "Welcome #{pname} to Blackjack where your money will soon be mine"
puts "#{pname} enter your first wager."
wager = gets.chomp.to_i
puts "#{pname} kiss that $#{wager} good-bye!"
dealer_score = 0
player_score = 0
hit_or_stay = ''

suits = ['C', 'S', 'D', 'H']

cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = cards.product(suits) # prefer my cards called by number then suit
deck.shuffle!

player_cards = []
dealer_cards = []

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

player_score = calc_total(player_cards)

dealer_score = calc_total(dealer_cards)

puts ''
puts "#{pname} has: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_score}"
puts ''
puts "Dealer has: #{dealer_cards[0]} and #{dealer_cards[1]}, for a total of #{dealer_score}"
if dealer_score >= 17
  puts "Dealer Stays"
end
if dealer_score == 21
  puts "Dealer has won"
  exit
end

until hit_or_stay == '2'
  puts ''
  puts "#{pname} has: #{player_cards} , for a total of #{player_score}"
  if player_score > 21 
    puts "#{pname} has lost"
    exit
  end
  if player_score == 21 
    puts "#{pname} stays"
    break
  end
  puts "#{pname} would you like to 1) hit or 2) stay?"
  hit_or_stay = gets.chomp
  if !['1', '2'].include?(hit_or_stay)
    puts "Error: you must enter 1 or 2"
    next
  end
  if hit_or_stay == '2'
    break
  end
  player_cards << deck.pop
  p player_cards
  player_score = calc_total(player_cards)
end

while dealer_score <= 17
  dealer_cards << deck.pop
  p dealer_cards
  dealer_score = calc_total(dealer_cards)
end

puts "Dealer has: #{dealer_cards} , for a total of #{dealer_score}"
if player_score > dealer_score && player_score <= 21
  puts "#{pname} wins!"
elsif dealer_score > player_score && dealer_score <=21
  puts "Dealer Wins!"
elsif player_score > 21
  puts "Dealer Wins!"
elsif dealer_score > 21
  puts "#{pname} Wins!"
end

exit
