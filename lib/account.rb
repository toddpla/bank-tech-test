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

  def transaction_count
    transactions.length
  end

  private

  def transactions
    @transactions.dup
  end

end
