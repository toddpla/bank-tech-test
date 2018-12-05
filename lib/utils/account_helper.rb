require_relative '../utils/formatting'

module AccountHelper

  include Formatting

  def statement
    "date || credit || debit || balance\n" <<
      ledger.map do |t|
        "#{pretty_date(t.date)} || "\
        "#{t.credit && "#{currency(t.credit)} "}|| "\
        "#{t.debit && "#{currency(t.debit)} "}|| "\
        "#{currency(t.balance)}"
      end.join("\n")
  end

end
