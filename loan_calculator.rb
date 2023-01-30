def prompt(message)
  puts("=> #{message}")
end

def calculate_monthly_interest(apr)
  apr / 12
end

def calculate_loan_duration_months(years, months = 0)
  years * 12 + months
end

def calculate_monthly_payment(loan, monthly_interest, loan_duration_months)
  (loan *
    (monthly_interest / (1 - (1 + monthly_interest)**(-loan_duration_months)))).round(2)
end

prompt("Welcome to the loan calculator")
puts("-" * 40)

prompt("Please enter your loan ammount: ")
loan_amount = gets.chomp.to_i

prompt("Please enter your APR in decimal form: ")
apr = gets.chomp.to_f

prompt("Please enter your loan duration in years: ")
loan_duration_years = gets.chomp.to_i

prompt("Calculating...")
sleep 2

puts(("-" * 20) + " Results " + ("-" * 20))

p monthly_interest = calculate_monthly_interest(apr)

p loan_duration_months = calculate_loan_duration_months(loan_duration_years)

p monthly_payment = calculate_monthly_payment(loan_amount, monthly_interest, loan_duration_months)

p total_of_monthly_payments = monthly_payment * loan_duration_months
