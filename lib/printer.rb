class Printer

	HEADER = "date || credit || debit || balance\n"

	attr_reader :data
	
	def initialize(data)
		@data = data
	end

	def ascending
		@data = data.sort_by{ |h| h[:date] }
		output
	end

	def descending
		@data = data.sort_by{ |h| h[:date] }.reverse
		output
	end

	private

		def output
			txt = HEADER
			@data.each do |x|
				txt += "#{x[:date]} || #{x[:credit]} || #{x[:debit]} || #{x[:balance]}\n"
			end
			txt
		end

end