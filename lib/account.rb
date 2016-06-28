require 'time'

class Account

	attr_reader :transactions, :balance

	def initialize(balance = 0)
		@balance = balance.to_f
		@transactions = []
	end

	def deposit(amount, date = Time.now)
		@balance += amount.to_f
		date = Time.parse(date) if isString?(date)
		@transactions << { date: date.strftime('%d/%m/%Y'), credit: sprintf('%.2f', amount),
			debit: '', balance: sprintf('%.2f', balance) }
	end

	def withdrawal(amount, date = Time.now)
		raise "Balance is lower than the requested amount" if amount.to_f > balance
		@balance -= amount.to_f
		date = Time.parse(date) if isString?(date)
		@transactions << { date: date.strftime('%d/%m/%Y'), credit: '',
			debit: sprintf('%.2f', amount), balance: sprintf('%.2f', balance) }
	end

	def print_bank_statement
		sort_desc
		puts "date || credit || debit || balance"
		@transactions.each do |t|
			puts "#{t[:date]} || #{t[:credit]} || #{t[:debit]} || #{t[:balance]}"
		end
	end

	private

		def isString?(date)
			date.is_a? String
		end

		def sort_asc
			@transactions = transactions.sort_by{ |h| h[:date]}
		end

		def sort_desc
			@transactions = sort_asc.reverse
		end

end