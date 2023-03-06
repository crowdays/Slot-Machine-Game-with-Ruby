#Name: Slot Machine Game with Ruby
#Date: 2/23/23
#Creator: Lorenzo Juarez

#Description:
#This program simulates a slot machine game using the Ruby programming language.
#It defines the symbols for the slot machine, the board layout, and the pay table.
#The program also defines a spin function, which randomly generates a new board and displays it on the screen.
#The game loop allows the player to spin the slots and win coins based on the pay table. The player's balance is
#updated after each spin and displayed on the screen.
#Technologies Used:
#This program was written in Ruby.


# Define slot machine symbols
SYMBOLS = ['💎', '🍒', '🍀', '🍊', '🍇']

# Define the slot machine board
board = [[SYMBOLS.sample, SYMBOLS.sample, SYMBOLS.sample],
         [SYMBOLS.sample, SYMBOLS.sample, SYMBOLS.sample],
         [SYMBOLS.sample, SYMBOLS.sample, SYMBOLS.sample]]

# Define the slot machine pay table
PAY_TABLE = {
  ['💎', '💎', '💎'] => 1000,
  ['🍒', '🍒', '🍒'] => 500,
  ['🍀', '🍀', '🍀'] => 250,
  ['🍊', '🍊', '🍊'] => 100,
  ['🍇', '🍇', '🍇'] => 50,
  ['💎', '💎', '🍒'] => 25,
  ['💎', '💎', '🍀'] => 20,
  ['💎', '💎', '🍊'] => 15,
  ['💎', '💎', '🍇'] => 10,
  ['🍒', '🍒', '🍀'] => 5,
  ['🍒', '🍒', '🍊'] => 4,
  ['🍒', '🍒', '🍇'] => 3,
  ['🍀', '🍀', '🍊'] => 2,
  ['🍀', '🍀', '🍇'] => 1
}

# Define the slot machine spin function
def spin
  board = [[SYMBOLS.sample, SYMBOLS.sample, SYMBOLS.sample],
           [SYMBOLS.sample, SYMBOLS.sample, SYMBOLS.sample],
           [SYMBOLS.sample, SYMBOLS.sample, SYMBOLS.sample]]
  puts "-------------"
  board.each do |row|
    row.each do |symbol|
      print "| #{symbol} "
    end
    puts "|"
  end
  puts "-------------"
  puts ""
  return board
end

# Start the game loop
balance = 100
loop do
  puts "You have #{balance} coins."
  puts "Enter 's' to spin slots or 'exit' to quit."
  input = gets.chomp.downcase
  break if input == "exit"

  if input == "s"
    if balance < 1
      puts "Sorry, you don't have enough coins to play."
      next
    end
    balance -= 1
    puts ""
    puts "Spinning..."
    board = spin
    winnings = 0
    PAY_TABLE.each do |symbols, payout|
      if board[0] == symbols
        puts "You won #{payout} coins!"
        winnings = payout
      end
    end
    balance += winnings
  else
    puts "Invalid input, please try again."
  end
  puts ""
end

puts "Thanks for playing! Your final balance is #{balance} coins."
