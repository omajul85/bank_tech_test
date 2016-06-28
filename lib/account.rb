require 'time'

class Account

	OVERDRAFT_ERROR = "Balance is lower than the requested amount"

	attr_reader :transactions, :balance, :printer

	def initialize(printer = Printer, balance = 0)
		@balance = balance.to_f
		@transactions = []
		@printer = printer
	end

	def deposit(amount, date = Time.now)
		@balance += amount.to_f
		date = Time.parse(date) if isString?(date)
		@transactions << { date: date.strftime('%d/%m/%Y'), credit: sprintf('%.2f', amount),
			debit: '', balance: sprintf('%.2f', balance) }
	end

	def withdrawal(amount, date = Time.now)
		raise OVERDRAFT_ERROR if amount.to_f > balance
		@balance -= amount.to_f
		date = Time.parse(date) if isString?(date)
		@transactions << { date: date.strftime('%d/%m/%Y'), credit: '',
			debit: sprintf('%.2f', amount), balance: sprintf('%.2f', balance) }
	end

	def print_bank_statement(mode = "")
		p = printer.new(transactions)
		return p.ascending if mode == "ASC"
		p.descending
	end

	private

		def isString?(date)
			date.is_a? String
		end

end