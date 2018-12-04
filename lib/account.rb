class Account

  def initialize(transactionClass)
    @transactions = []
    @transactionClass = transactionClass
  end

  def deposit(amount, date)
    @transactions.unshift(@transactionClass.new(amount, nil, date, prev_balance))
  end

  def withdrawal(amount, date)
    @transactions.unshift(@transactionClass.new(nil, amount, date, prev_balance))
  end

  def statement
    "date || credit || debit || balance\n" << (
      transactions.map do |t|
        "#{t.date} || #{t.credit} || #{t.debit} || #{t.balance}"
      end.join("\n")
    )
  end

  def transaction_count
    transactions.length
  end

  private

  def transactions
    @transactions.dup
  end

  def prev_balance
    transactions[-1] && transactions[-1].balance
  end

end
