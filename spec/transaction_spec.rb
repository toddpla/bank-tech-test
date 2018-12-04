require 'transaction'
require 'date'

describe Transaction do
  describe '#balance' do
    context 'when a credit' do
      it 'should be set on initialize' do
        transaction = described_class.new(100.00, nil, Date.new(2012, 01, 10), 0.00)
        expect(transaction.balance).to eq 100.00
      end
    end
    context 'when a debit' do
      it 'should be set on initialize' do
        transaction = described_class.new(nil, 100.00, Date.new(2012, 01, 10), 0.00)
        expect(transaction.balance).to eq -100.00
      end
    end
  end
end
