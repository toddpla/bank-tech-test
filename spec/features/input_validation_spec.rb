require 'date'
require './lib/models/account'
require './lib/models/transaction'
require './lib/models/statement'

describe 'statement' do
  it 'prints out the statements correctly ignoring invalid input' do
    account = Account.new(Transaction, Statement)
    account.deposit(1000.00, Date.new(2012, 01, 10))
    account.deposit(1.123, Date.new(2012, 01, 10))
    account.deposit(2000.00, Date.new(2012, 01, 13))
    account.withdrawal(500.00, Date.new(2012, 01, 14))
    expect(account.statement.read).to eq "date || credit || debit || balance\n"\
                                      "14/01/2012 || || 500.00 || 2500.00\n"\
                                      "13/01/2012 || 2000.00 || || 3000.00\n"\
                                      "10/01/2012 || 1000.00 || || 1000.00"
  end
end
