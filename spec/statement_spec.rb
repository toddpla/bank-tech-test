# require 'date'
# require 'statement'
#
#
# describe Statement do
#   let(:t_one) {double :t_one, date: Date.new(2012, 01, 10), credit: 1000.00, debit: nil, balance: 1000.00 }
#   let(:t_two) {double :t_two, date: Date.new(2012, 01, 13), credit: 2000.00, debit: nil, balance: 3000.00 }
#   let(:t_three) {double :t_three, date: Date.new(2012, 01, 14), credit: nil, debit: 500.00, balance: 2500.00 }
#
#   let(:ledger) {[t_three, t_two, t_one]}
#
#   describe '#print' do
#     it "should print the statement correctly" do
#       expect(subject.print).to eq("date || credit || debit || balance\n"\
#                                   "14/01/2012 || || 500.00 || 2500.00\n"\
#                                   "13/01/2012 || 2000.00 || || 3000.00\n"\
#                                   "10/01/2012 || 1000.00 || || 1000.00")
#     end
#   end
# end
