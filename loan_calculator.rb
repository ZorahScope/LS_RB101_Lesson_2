def prompt(message)
  puts("=> #{message}")
end

def calculate_monthly_interest(apr)
  (apr / 100) / 12.0
end

def calculate_loan_duration_months(years)
  (years * 12.to_f).round
end

def calculate_monthly_payment(loan, monthly_interest, loan_duration_months)
  if monthly_interest == 0
    loan / loan_duration_months.to_f
  else
    (
      loan *
        (monthly_interest / (
          1 - (1 + monthly_interest)**(-loan_duration_months)
        ))
    ).round(2)
  end
end

def round_to_hundredths(number)
  format('%.2f', number)
end

def decimal_to_percentage(interest)
  round_to_hundredths(interest * 100.to_f)
end

# Receive Inputs
prompt("Welcome to the loan calculator")
loop do
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

    if apr.to_s.empty? || apr.to_f < 0
      prompt("Must enter a postivie Integer")
    else
      break
    end
  end

  prompt("Please enter your loan duration in years: ")
  loan_duration_years = ""
  loop do
    loan_duration_years = gets.chomp.to_f

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
    calculate_monthly_payment(
      loan_amount,
      monthly_interest,
      loan_duration_months
    )

  total_of_monthly_payments = monthly_payment * loan_duration_months.to_f

  results = <<-MSG
  Loan Amount: $#{loan_amount}
  Payment Every Month: $#{round_to_hundredths(monthly_payment)}
  Total of #{loan_duration_months} Payments: $#{round_to_hundredths(total_of_monthly_payments)}
  Monthly Interest Rate: #{decimal_to_percentage(monthly_interest)}%
  APR: #{apr}%
MSG

  puts(results)
  puts(("-" * 49) + "\n\n")

  prompt("Do you want to perform another calculation? (Y to run again)")
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for using the loan calculator, goodbye!")
