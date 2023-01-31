def prompt(message)
  puts("=> #{message}")
end

def calculate_monthly_interest(apr)
  (apr / 100) / 12.0
end

def calculate_loan_duration_months(years, months = 0)
  years * 12 + months
end

def calculate_monthly_payment(loan, monthly_interest, loan_duration_months)
  (
    loan *
      (monthly_interest / (1 - (1 + monthly_interest)**(-loan_duration_months)))
  ).round(2)
end

# Receive Inputs
prompt("Welcome to the loan calculator")
puts("-" * 40)

prompt("Please enter your loan ammount: ")
loan_amount = ""
loop do
  loan_amount = gets.chomp.to_i

  if loan_amount.to_s.empty? || loan_amount.to_f <= 0
    prompt("Must enter a postivie Integer")
  else
    break
  end
end

prompt("Please enter your APR: ")
prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
apr = ""
loop do
  apr = gets.chomp.to_f

  if apr.to_s.empty? || apr.to_f <= 0
    prompt("Must enter a postivie Integer")
  else
    break
  end
end

prompt("Please enter your loan duration in years: ")
loan_duration_years = ""
loop do
  loan_duration_years = gets.chomp.to_i

  if loan_duration_years.to_s.empty? || loan_duration_years.to_f <= 0
    prompt("Must enter a postivie Integer")
  else
    break
  end
end

# Calculate Outputs
prompt("Calculating...\n")
sleep 1

puts(("-" * 20) + " Results " + ("-" * 20))

monthly_interest = calculate_monthly_interest(apr)

loan_duration_months = calculate_loan_duration_months(loan_duration_years)

monthly_payment =
  calculate_monthly_payment(loan_amount, monthly_interest, loan_duration_months)

total_of_monthly_payments = monthly_payment * loan_duration_months

results = <<-MSG
  Payment Every Month: #{monthly_payment}
  Total of #{loan_duration_months} Payments: #{total_of_monthly_payments}
  Monthly Interest Rate: #{(monthly_interest * 100.to_f)}%
MSG

puts(results)
