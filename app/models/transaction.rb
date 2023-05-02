class Transaction < ApplicationRecord
  belongs_to :envelope, class_name: 'Envelope'
  belongs_to :account, class_name: 'BankingAccount'

  def type=(value)
    value ||= (amount < 0 ? 'Credit' : 'Debit')
    super(value)
  end
end
