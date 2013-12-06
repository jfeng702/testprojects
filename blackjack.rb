

def calculate_total(cards)
# [['H', '3',], ['S', 'Q'], ... ]

  arr = cards.map {|e| e[1]}

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # J, Q, K 
      total = total + 10
    else 
      total += value.to_i
    end
  end


  #correct for Aces
  arr.select{|e| e == "A"}.count.times do
    if total > 21
      total = total - 10
    end

  end


  total
end

puts 'Welcome to this game of Blackjack.'



suits = ['H', 'D', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = []
suits.each do |suit|
  cards.each do |card|
deck << [suit, card]
end
end


deck = suits.product(cards)


deck.shuffle!

# Deal cards

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)

puts "mycards is: " + mycards.to_s
puts
puts "dealercards is: " + dealercards.to_s

# Show cards
puts " You have #{mycards[0]} and #{mycards[1]}, for a total of #{mytotal}"
puts "The Dealer has #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
puts ""

# Player turn


while mytotal < 21
  puts "What would you like to do? 1) hit 2) stay"
  choice1 = gets.chomp
  if choice1 = 1.to_s
    mycards << deck.pop
    mytotal = calculate_total(mycards)
    puts " You have #{mycards}, for a total of #{mytotal}"
      if mytotal > 21
        puts "You bust."
      elsif mytotal == 21
        puts "21 Blackjack"
      end
  end
end


=begin
if choice1 == 1.to_s
  puts "You chose to hit."
  mycards << deck.pop
  mytotal = calculate_total(mycards)
  if mytotal > 21
    puts "You have #{mycards[0]} #{mycards[1]} and #{mycards[2]}, for a total of #{mytotal}"    
    puts "Bust. You lose."
  else
    mytotal = calculate_total(mycards)
    puts "You have #{mycards[0]} #{mycards[1]} and #{mycards[2]}, for a total of #{mytotal}"
  end
end
if choice1 == 2.to_s
  puts "You chose to stay."
end
puts "Dealer has #{dealercards}"
=end