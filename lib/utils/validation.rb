require 'bigdecimal'

module Validation

  def currency?(amount)
    (BigDecimal.new(amount.to_s) * 100) % 1 === 0
  end

end
