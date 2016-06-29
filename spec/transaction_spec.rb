require 'transaction'

describe Transaction do

	subject(:transaction) { Transaction.new(date: "13/01/2012", debit: 500, balance: 1000) }

	describe "#to_s" do
		it "returns the string version of the transaction" do
			expect(transaction.to_s).to eq "13/01/2012 ||  || 500.00 || 1000.00"
		end
	end
end