class Transaction

	attr_reader :debit, :credit, :date, :balance

	def initialize(date: Date.today.strftime('%d/%m/%Y'), credit: "", debit: "", balance:)
		@date    = date
		@debit   = debit
		@credit  = credit
		@balance = balance
	end

	def to_s
		"#{@date} || #{@credit} || #{@debit} || #{@balance}\n"
	end

end