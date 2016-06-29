require 'printer'
require 'transaction'

describe Printer do

	let(:transactions) do
		[Transaction.new(date: "10/01/2012", credit: 1000, balance: 1000),
		Transaction.new(date: "13/01/2012", credit: 2000, balance: 3000)]
	end

	subject(:printer) { Printer.new }

	before(:each) { printer.set_data transactions }

	describe "#set_data" do
		it "sets the data that must be printed" do
			expect(printer.data).to eq transactions
		end
	end

	describe "#to_s" do
		it "creates the string of data that needs to be printed" do
			result = "date || credit || debit || balance\n10/01/2012 || 1000.00 ||  || 1000.00\n13/01/2012 || 2000.00 ||  || 3000.00"
			expect(printer.to_s).to eq result
		end
	end

end