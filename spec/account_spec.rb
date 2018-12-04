require 'account'
require 'date'

describe Account do

  let(:transactionClass) { double('transactionClass', new: nil )}
  let(:account) { described_class.new(transactionClass) }

  describe '#deposit' do
    it 'should add a credit transaction to the account' do
      account.deposit(1000.00, Date.new(2012,01,10))
      expect(account.transaction_count).to eq 1
    end
  end

  describe '#withdrawal' do
    it 'should add a credit transaction to the account' do
      account.withdrawal(1000.00, Date.new(2012,01,10))
      expect(account.transaction_count).to eq 1
    end
  end

  describe '#statement' do
    it 'should print the statement of transactions' do
      transaction_1 = double('transaction_1', credit: 100.00, debit: nil, date: Date.new(2012,01,10), balance: 100.00)
      transactions = [transaction_1]
      allow(account).to receive(:transactions).and_return(transactions)
      expect(account.statement).to eq "date || credit || debit || balance\n"\
                                      "2012-01-10 || 100.0 ||  || 100.0"
    end
  end

end
