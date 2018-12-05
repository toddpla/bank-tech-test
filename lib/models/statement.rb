require_relative '../utils/formatting'

class Statement

  include Formatting

  def initialize(header, transactions)
    @header = header
    @transactions = transactions
  end

  def read
    @header <<
      @transactions.map do |t|
        "#{pretty_date(t.date)} || "\
        "#{t.credit && "#{currency(t.credit)} "}|| "\
        "#{t.debit && "#{currency(t.debit)} "}|| "\
        "#{currency(t.balance)}"
      end.join("\n")
    end

end
