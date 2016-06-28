require 'account'
require 'transaction'
require 'printer'

describe Account do

	subject(:account) { Account.new Transaction, Printer }

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

	end

	describe "#deposit" do
		it "increases the balance by amount of money" do
			account.deposit(100)
			expect(account.balance).to eq 100.0
		end

		it "adds a transaction to the array" do
			expect { account.deposit(100) }.to change { account.transactions.length }.by 1
		end
	end

	describe "#withdrawal" do

		before(:each) do
			account.deposit(100)
		end

		it "decreases the balance by amount of money" do
			account.withdrawal(10)
			expect(account.balance).to eq 90.0
		end

		it "adds a transaction to the array" do
			expect { account.withdrawal(10) }.to change { account.transactions.length }.by 1
		end

		it "raises error if withdrawal amount exceeds the current balance" do
			expect{ account.withdrawal(200) }.to raise_error(RuntimeError, Account::OVERDRAFT_ERROR)
		end

	end 

end