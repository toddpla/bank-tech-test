class Transaction

  def initialize(credit, debit, date, prev_balance)
    @credit = credit
    @debit = debit
    @date = date
    @balance = prev_balance.to_f + credit.to_f - debit.to_f
  end

  def balance
    @balance
  end

  def date
    @date
  end

  def pretty_date
    date.strftime("%d/%m/%Y")
  end

  def credit
    @credit
  end

  def debit
    @debit
  end

end
