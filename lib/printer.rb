class Printer

	HEADER = "date || credit || debit || balance\n"

	attr_reader :data
	
	def set_data(data)
		@data = data
	end

	def to_s
		output
	end

	private

		def output
			txt = HEADER
			data.each do |x|
				txt += x.to_s + "\n"
			end
			txt.chomp
		end

end