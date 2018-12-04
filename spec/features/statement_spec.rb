require 'date'
require 'account'
require 'transaction'

describe 'statement' do
  it 'prints correctly with showing credits and debits with date and balance' do
    account = Account.new(Transaction)
    account.deposit(1000.00, Date.new(2012,01,10))
    account.deposit(2000.00, Date.new(2012,01,13))
    account.withdrawal(500.00, Date.new(2012,01,14))
    expect(account.statement).to eq ("date || credit || debit || balance
                                      14/01/2012 || || 500.00 || 2500.00
                                      13/01/2012 || 2000.00 || || 3000.00
                                      10/01/2012 || 1000.00 || || 1000.00")
  end
end
