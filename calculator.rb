def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

print("Welcome to the Calculator! Enter your name: ")

name = ""
loop do
  name = Kernel.gets.chomp

  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hello, #{name}")

loop do
  # ask the user for two numbers
  number1 = ""
  loop do
    prompt("What's the first number?: ")
    number1 = Kernel.gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("Error: Invalid number")
    end
  end

  number2 = ""
  loop do
    prompt("What's the second number?: ")
    number2 = Kernel.gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("Error: Invalid number")
    end
  end

  prompt("")

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add 
    2) subtract 
    3) multiply 
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ""
  loop do
    # ask the user for an operation to perform
    operator = Kernel.gets.chomp

    if %w[1 2 3 4].include?(operator)
      break
    else
      prompt("Error: Invalid operator!! , Must choose 1, 2, 3, 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  # perform the operation on the two numbers
  result =
    case operator
    when "1"
      number1.to_i + number2.to_i
    when "2"
      number1.to_i - number2.to_i
    when "3"
      number1.to_i * number2.to_i
    when "4"
      number1.to_i / number2.to_f
    else
      "invalid, due to incorrect operation"
    end

  # output the result
  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to run again)")
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for using the calculator, good-bye!")
