require 'printer'

describe Printer do

	let(:transactions) do
		[{date: "10/01/2012", credit: 1000, debit: "", balance: 1000 },
		{date: "13/01/2012", credit: 2000, debit: "", balance: 3000 }]
	end

	subject(:printer) { Printer.new(transactions) }

	describe "#initialization" do
		it "accepts the data that must be printed" do
			expect(printer.data).to eq transactions
		end
	end

	describe "#ascending" do
		it "organizes the data for being printed in ascending order" do
			result = "date || credit || debit || balance\n10/01/2012 || 1000 ||  || 1000\n13/01/2012 || 2000 ||  || 3000\n"
			expect(printer.ascending).to eq result
		end
	end

	describe "#descending" do
		it "organizes the data for being printed in descending order" do
			result = "date || credit || debit || balance\n13/01/2012 || 2000 ||  || 3000\n10/01/2012 || 1000 ||  || 1000\n"
			expect(printer.descending).to eq result
		end
	end

end