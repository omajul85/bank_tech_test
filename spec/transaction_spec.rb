require 'transaction'

describe Transaction do

	subject(:transaction) { Transaction.new(date: "13/01/2012", debit: 500, balance: 1000) }

	describe "#initialization" do
		it "accepts the data that must be printed" do
			expect(transaction.debit).to eq 500
		end
	end
end