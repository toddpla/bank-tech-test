require './lib/utils/formatting'

describe Formatting do

  describe '#currency' do
    let(:mock) { Class.new { extend Formatting } }
    it 'should pad with two zeros' do
      expect(mock.currency(9)).to eq '9.00'
    end
    it 'should round floats to two decimal places' do
      expect(mock.currency(9.126)).to eq "9.13"
    end
  end
end
