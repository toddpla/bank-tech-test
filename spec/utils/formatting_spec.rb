require './lib/utils/formatting'
require 'date'

describe Formatting do
  let(:mock) { Class.new { extend Formatting } }
  describe '#currency' do
    it 'should pad with two zeros' do
      expect(mock.currency(9)).to eq '9.00'
    end
    it 'should round floats to two decimal places' do
      expect(mock.currency(9.126)).to eq "9.13"
    end
  end
  describe "#pretty_date" do
    it "should return date in format dd/mm/yyyy" do
      expect(mock.pretty_date(Date.new(2018, 12, 05))).to eq "05/12/2018"
    end
  end
end
