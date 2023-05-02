class Account < ApplicationRecord
  has_many :transactions, -> { order(:date) }, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def current_balance
    balance(Date.today)
  end

  def add_transaction(**attributes)
    transactions.create!(**attributes)
  end

  def solvent?(date)
    balance(date) >= 0
  end

  def validate!(date)
    @transactions[@starting_date] += 1 until solvent?(date)

    balance(date).tap do |amount|
      puts "#{date}: STARTING BALANCE => #{starting_balance}; BALANCE => #{amount}"
    end
  end

  def balance(balance_date)
    transactions.sum(0) do |transaction|
      transaction.date <= balance_date ? transaction.amount : 0
    end
  end
end
