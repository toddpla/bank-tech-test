class Transaction

  attr_reader :date, :balance, :credit, :debit

  def initialize(credit, debit, date, prev_balance)
    @credit = credit
    @debit = debit
    @date = date
    @balance = prev_balance.to_f + credit.to_f - debit.to_f
  end

end
