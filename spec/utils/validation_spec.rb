require './lib/utils/validation'

describe Validation do
  let(:mock) { Class.new { extend Validation } }
  describe '#currency?' do
    it 'should return true for 9.12' do
      expect(mock.currency?(9.12)).to be_truthy
    end
    it 'should return false for 9.122' do
      expect(mock.currency?(9.122)).to be_falsey
    end
  end
end
