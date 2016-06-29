class Transaction

	def initialize(date:, credit: nil, debit: nil, balance:)
		@date    = date
		@debit   = debit
		@credit  = credit
		@balance = balance
	end

	def to_s
		"#{date} || #{format(credit)} || #{format(debit)} || #{format(balance)}"
	end

	private

		attr_reader :debit, :credit, :date, :balance

		def format(amount)
			return "" if amount.nil?
			sprintf('%.2f', amount)
		end

end