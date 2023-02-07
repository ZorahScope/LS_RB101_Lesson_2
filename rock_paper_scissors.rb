VALID_CHOICES = %w[rock paper scissors]

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

def display_results(player, computer)
  puts("You chose: #{player}; Computer chose: #{computer}\n\n")

  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie")
  end
end

def update_score!(scoreboard, player, computer)
  if win?(player, computer)
    scoreboard[:player] += 1
  elsif win?(computer, player)
    scoreboard[:computer] += 1
  end
end

scoreboard = { player: 0, computer: 0 }

loop do
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(", ")} ")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  display_results(choice, computer_choice)

  update_score!(scoreboard, choice, computer_choice)

  if scoreboard.value?(3)
    winner = scoreboard.rassoc(3)
    prompt("#{winner[0].capitalize} is the grand total winner")
    break
    # else
    # prompt("Do you want to play again?")
    # answer = gets.chomp
    # break unless answer.downcase.start_with?("y")
  end
end

prompt("Thank you for playing. Good bye!")
