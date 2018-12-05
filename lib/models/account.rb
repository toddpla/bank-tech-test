require_relative '../utils/account_helper'

class Account

  include AccountHelper

  def initialize(trans_class)
    @ledger = []
    @trans_class = trans_class
  end

  def deposit(amount, date = Date.today)
    return unless currency?(amount)
    add_transaction(amount, nil, date)
    last_transaction
  end

  def withdrawal(amount, date = Date.today)
    return unless currency?(amount)
    add_transaction(nil, amount, date)
    last_transaction
  end

  def transaction_count
    ledger.length
  end

  private

  def add_transaction(credit, debit, date)
    @ledger.unshift(@trans_class.new(credit, debit, date, prev_balance))
  end

  def currency?(amount)
    (amount * 100) % 1 === 0
  end

  def ledger
    @ledger.dup
  end

  def prev_balance
    ledger[0] && ledger[0].balance
  end

  def last_transaction
    ledger[0]
  end

end
