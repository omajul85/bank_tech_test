require 'account'
require 'transactions'
require 'printer'

describe Account do

	subject(:account) { Account.new }

	describe "#initialization" do	

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

		it "adds the transaction to the array" do
			expect { account.deposit(100) }.to change { account.transactions.all.length }.by 1
		end
	end

	describe "#withdraw" do

		before(:each) do
			account.deposit(100)
		end

		it "decreases the balance by amount of money" do
			account.withdraw(10)
			expect(account.balance).to eq 90.0
		end

		it "adds a transaction to the array" do
			expect { account.deposit(100) }.to change { account.transactions.all.length }.by 1
		end

		it "raises error if withdrawal amount exceeds the current balance" do
			expect{ account.withdraw(200) }.to raise_error(RuntimeError, Account::OVERDRAFT_ERROR)
		end

	end 

end