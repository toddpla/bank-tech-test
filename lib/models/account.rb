require_relative '../utils/validation'

class Account

  include Validation

  attr_accessor :statement

  def initialize(trans_class, statement_class)
    @ledger = []
    @trans_class = trans_class
    header = "date || credit || debit || balance\n"
    @statement = statement_class.new(@ledger, header)
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

  def ledger
    @ledger.dup
  end

  def last_transaction
    ledger[0]
  end

  def prev_balance
    last_transaction && last_transaction.balance
  end

end
