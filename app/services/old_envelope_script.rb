require "active_support/all"

class Envelope
  attr_accessor :starting_date, :debits, :credits

  def initialize
    @starting_date = Date.today
    @debits = { @starting_date => 0 }
    @credits = {}
  end

  def transaction(date, amount)
    date = date.to_date
    if amount.to_i <= 0
      @credits[date] ||= 0
      @credits[date] += amount.to_i
    else
      @debits[date] ||= 0
      @debits[date] += amount.to_i
    end
  end

  def validate(date)
    until (amount = balance(date)) >= 0
      date, = @debits.map(&:first).sort.reverse.find { |dte,| dte <= date }
      @debits[date] += 1
    end
    amount
  end

  def balance(date)
    transactions.sum(0) do |transaction_date, amount|
      transaction_date <= date ? amount : 0
    end
  end

  def transactions
    (@credits.to_a + @debits.to_a).sort_by(&:first)
  end

  def starting_balance
    @debits[@starting_date]
  end
end


env = Envelope.new
today = Date.today

payment = 900
monthly_payment = 2021
first_due_date = "01-06-2023".to_date
end_date = "02-01-2024".to_date

payment_dates  = 77.times.filter_map do |i|
  date = "05-05-2023".to_date + (i * 2).weeks

  date if date <= end_date
end

def due_date(date)
  return date if date.on_weekday?

  date.prev_weekday
end

bill_dates = 36.times.filter_map do |i|
  date = first_due_date + i.months

  due_date(date) if due_date(date) <= end_date
end

env = Envelope.new
payment = 800

payment_dates.each { |date| env.transaction(date, payment) }
bill_dates.each { |date| env.transaction(date, -monthly_payment) }
(Date.today..end_date).each { |date| env.validate(date) }

while (env.debits.map(&:last).max - payment) > 50
  payment += 1
  env = Envelope.new

  payment_dates.each { |date| env.transaction(date, payment) }
  bill_dates.each { |date| env.transaction(date, -monthly_payment) }
  (Date.today..end_date).each { |date| env.validate(date) }

  puts <<~MSG.squish
    PAYMENT => #{payment};
    STARTING BALANCE => #{env.starting_balance}
    BALANCE => #{env.balance(end_date)}
  MSG
end

(Date.today..end_date).each do |date|
  puts <<~MSG.squish
    PAYMENT => #{payment};
    STARTING BALANCE => #{env.starting_balance}
    BALANCE => #{env.balance(date)}
  MSG
end
