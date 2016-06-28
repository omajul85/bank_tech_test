require 'date'

class Account

	OVERDRAFT_ERROR = "Balance is lower than the requested amount"

	attr_reader :transactions, :balance, :printer

	def initialize(transaction = Transaction, printer = Printer)
		@balance = 0.0
		@transactions = []
		@printer = printer
		@transaction = transaction
	end

	def deposit(amount, date = nil)
		@balance += amount.to_f
		date = get_date(date)
		@transactions.unshift @transaction.new(date: date, credit: sprintf('%.2f', amount), balance: sprintf('%.2f', balance))
	end

	def withdrawal(amount, date = nil)
		raise OVERDRAFT_ERROR if amount.to_f > balance
		@balance -= amount.to_f
		date = get_date(date)
		@transactions.unshift @transaction.new(date: date, debit: sprintf('%.2f', amount), balance: sprintf('%.2f', balance))
	end

	def print_bank_statement
		p = printer.new(transactions)
		p.display
	end

	private

		def get_date(date)
			res = date.nil? ? Date.today : Date.parse(date)
			res.strftime('%d/%m/%Y')
		end

end