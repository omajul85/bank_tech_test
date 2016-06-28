require 'account'

describe Account do

	subject(:account) { Account.new }

	it { is_expected.to respond_to :deposit }
	it { is_expected.to respond_to :withdrawal }
	it { is_expected.to respond_to :print_bank_statement }

	describe "#initialization" do	

		it "has an empty array of transactions" do
			expect(account.transactions).to eq []
		end
		
		context "when created with no money" do
			it "has a balance of 0.0" do
				expect(account.balance).to eq 0.0
			end
		end

		context "when created with some amount of money" do
			it "has a balance of that amount of money" do
				dummy_account = Account.new 10
				expect(dummy_account.balance).to eq 10.0
			end
		end

	end

end