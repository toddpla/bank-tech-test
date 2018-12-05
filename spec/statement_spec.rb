require './lib/models/statement'

describe Statement do

  let(:transaction_1) { double('transaction_1', credit: 100.00, debit: nil, date: Date.new(2012, 01, 10), balance: 100.00) }
  let(:transactions) { [transaction_1] }
  let(:statement) { described_class.new(transactions) }

  describe '#read' do
    it 'should display the statement in a tabular format with headers' do
      expect(statement.read).to eq "date || credit || debit || balance\n"\
                                      "10/01/2012 || 100.00 || || 100.00"
    end
  end

end
