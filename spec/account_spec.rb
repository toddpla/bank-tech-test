require './lib/models/account'
require 'date'

describe Account do

  let(:trans_class) { double('trans_class', new: nil) }
  let(:statement_class) { double('statement_class', new: 'statement_class') }
  let(:account) { described_class.new(trans_class, statement_class) }

  describe '#deposit' do
    it 'should add a credit transaction to the account' do
      account.deposit(1000.00, Date.new(2012, 01, 10))
      expect(account.transaction_count).to eq 1
    end
  end

  describe '#withdrawal' do
    it 'should add a credit transaction to the account' do
      account.withdrawal(1000.00, Date.new(2012, 01, 10))
      expect(account.transaction_count).to eq 1
    end
  end

  describe '#statement' do
    it 'should print the statement of transactions' do
      expect(account.statement).to eq 'statement_class'
    end
  end

end
