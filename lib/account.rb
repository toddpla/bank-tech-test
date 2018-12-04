require 'date'

class Account

  def initialize(transactionClass)
    @transactions = []
    @transactionClass = transactionClass
  end

  def deposit(amount, date=Date.today)
    return unless currency?(amount)
    add_transaction(amount, nil, date)
  end

  def withdrawal(amount, date=Date.today)
    return unless currency?(amount)
    add_transaction(nil, amount, date)
  end

  def statement
    "date || credit || debit || balance\n" << (
      transactions.map do |t|
        "#{t.pretty_date} || "\
        "#{t.credit && "#{t.credit} "}|| "\
        "#{t.debit && "#{t.debit} "}|| "\
        "#{t.balance}"
      end.join("\n")
    )
  end

  def transaction_count
    transactions.length
  end

  private

  def add_transaction(credit, debit, date)
    @transactions.unshift(@transactionClass.new(credit, debit, date, prev_balance))
  end

  def currency?(amount)
    (amount * 100) % 1 === 0
  end

  def transactions
    @transactions.dup
  end

  def prev_balance
    transactions[0] && transactions[0].balance
  end

end
