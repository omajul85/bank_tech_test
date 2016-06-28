require 'printer'
require 'transaction'

describe Printer do

	let(:transactions) do
		[Transaction.new(date: "10/01/2012", credit: 1000, balance: 1000),
		Transaction.new(date: "13/01/2012", credit: 2000, balance: 3000)]
	end

	subject(:printer) { Printer.new(transactions) }

	describe "#initialization" do
		it "accepts the data that must be printed" do
			expect(printer.data).to eq transactions
		end
	end

	describe "#display" do
		it "displays the data" do
			result = "date || credit || debit || balance\n10/01/2012 || 1000 ||  || 1000\n13/01/2012 || 2000 ||  || 3000\n"
			txt = printer.display
			expect(txt).to eq result
		end
	end

end