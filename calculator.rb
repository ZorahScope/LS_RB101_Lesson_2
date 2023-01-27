# frozen_string_literal: false

Kernel.puts('Welcome to the Calculator!').freeze

# ask the user for two numbers
print('What\'s the first number?: ')
number1 = Kernel.gets.chomp

print('What\'s the second number?: ')
number2 = Kernel.gets.chomp

number1 = number1
number2 = number2

Kernel.puts(
  'What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide'
)
# ask the user for an operation to perform
operator = Kernel.gets.chomp

# perform the operation on the two numbers
result =
  if operator == '1'
    number1.to_i + number2.to_i
  elsif operator == '2'
    number1.to_i - number2.to_i
  elsif operator == '3'
    number1.to_i * number2.to_i
  elsif operator == '4'
    number1.to_i / number2.to_f
  else
    'invalid, due to incorrect operation'
  end

# output the result
Kernel.puts("The result is #{result}")
