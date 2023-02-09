require 'io/console'

VALID_CHOICES = %w[rock paper scissors spock lizard]

WINNING_CONDITIONS = {
  rock: %w(lizard scissors),
  lizard: %w(spock paper),
  spock: %w(scissors rock),
  scissors: %w(paper lizard),
  paper: %w(rock spock)
}

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  WINNING_CONDITIONS[first.to_sym].include?(second)
end

def display_results(scoreboard, player, computer)
  puts("You chose: #{player}; Computer chose: #{computer}\n\n")

  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie")
  end
  current_score = <<-MSG
\nCurrent Score: 
Player - #{scoreboard[:player]}
Computer - #{scoreboard[:computer]}\n
MSG
  print(current_score)
end

def update_score!(scoreboard, player, computer)
  if win?(player, computer)
    scoreboard[:player] += 1
  elsif win?(computer, player)
    scoreboard[:computer] += 1
  end
end

def shorthand_valid?(choice)
  shorthand_error = <<-MSG
Shorthand not specific enough, more than 1 choice starts with '#{choice}',
Try adding a second letter.
  MSG

  result = VALID_CHOICES.select { |c| c.start_with?(choice) }
  if result.size > 1
    prompt(shorthand_error)
    false
  else
    !(result.size == 0) # returns false if Array#select has no matches
  end
end

def convert_shorthand(choice)
  proper_choice = VALID_CHOICES.select { |c| c.start_with?(choice) }
  proper_choice.pop
end

def prompt_user_choice
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')} ")
    choice = gets.chomp.strip.downcase

    if shorthand_valid?(choice)
      choice = convert_shorthand(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end
  choice
end

scoreboard = { player: 0, computer: 0 }

introduction = <<-MSG 
Welcome to Rock, Paper, Scissors, Spock, Lizard
First to score 3 is the grand winner\n
MSG

puts(introduction)

loop do
  choice = prompt_user_choice
  computer_choice = VALID_CHOICES.sample

  update_score!(scoreboard, choice, computer_choice)
  display_results(scoreboard, choice, computer_choice)

  if scoreboard.value?(3)
    winner = scoreboard.rassoc(3)
    prompt("#{winner[0].capitalize} is the grand total winner")
    break
  end

  sleep 2
  $stdout.clear_screen

end

prompt("Thank you for playing. Good bye!")
