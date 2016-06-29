require 'date'
require "./lib/transactions"
require "./lib/printer"

class Account

	OVERDRAFT_ERROR = "Balance is lower than the requested amount"

	attr_reader :transactions, :balance, :printer

	def initialize(transaction: nil, printer: nil)
		@balance = 0.0
		@transactions ||= Transactions.new
		@printer ||= Printer.new
	end

	def deposit(amount, date = nil)
		@balance += amount.to_f
		date = get_date(date)
		transactions.deposit(date, amount, balance)
	end

	def withdraw(amount, date = nil)
		raise OVERDRAFT_ERROR if amount.to_f > balance
		@balance -= amount.to_f
		date = get_date(date)
		transactions.withdraw(date, amount, balance)
	end

	def print_bank_statement(mode = "DESC", output = STDOUT)
		data = mode == "ASC" ? transactions.all : transactions.reverse
		printer.set_data(data)
		output.puts(printer.to_s)
	end

	private

		def get_date(date)
			res = date.nil? ? Date.today : Date.parse(date)
			res.strftime('%d/%m/%Y')
		end

end