require 'date'

feature 'statement' do
  scenario 'adds debits and credits then prints statement with correct balance' do
    account = Account.new
    account.credit(amount: 1000.00, date: Date.new(2012,01,10))
    account.credit(amount: 2000.00, date: Date.new(2012,01,13))
    account.debit(amount: 500.00, date: Date.new(2012,01,14))
    expect(account.statement).to eq ("date || credit || debit || balance
                                      14/01/2012 || || 500.00 || 2500.00
                                      13/01/2012 || 2000.00 || || 3000.00
                                      10/01/2012 || 1000.00 || || 1000.00")
  end
end
