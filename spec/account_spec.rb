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



end
