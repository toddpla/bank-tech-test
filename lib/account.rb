class Account

  def initialize(transactionClass)
    @transactions = []
    @transactionClass = transactionClass
  end

  def deposit(amount, date)
    @transactions << @transactionClass.new(amount, nil, date)
  end

  def withdrawal(amount, date)
    @transactions << @transactionClass.new(nil, amount, date)
  end

  def statement
    s = "date || credit || debit || balance\n"
    transactions.each do |t|
      s << "#{t.date} || #{t.credit} || #{t.debit} || #{t.balance}"
    end
    s
  end

  def transaction_count
    transactions.length
  end

  private

  def transactions
    @transactions.dup
  end

end
