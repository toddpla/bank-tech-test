class Transaction

  def initialize(credit, debit, date, prev_balance)
    @credit = credit
    @debit = debit
    @date = date
    @balance = prev_balance.to_f + credit.to_f - debit.to_f
  end

  def date
    @date
  end

  def pretty_date
    date.strftime("%d/%m/%Y")
  end

  def balance
    format_currency(@balance)
  end

  def credit
    format_currency(@credit)
  end

  def debit
    format_currency(@debit)
  end

  private

  def format_currency(amount)
    !!amount ? sprintf('%.2f', amount) : nil
  end

end
