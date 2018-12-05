require 'date'

module Formatting

  def currency(amount)
    !!amount ? sprintf('%.2f', amount) : nil
  end

  def pretty_date(date)
    date.strftime("%d/%m/%Y")
  end

end
