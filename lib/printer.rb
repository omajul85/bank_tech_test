class Printer

	HEADER = "date || credit || debit || balance\n"

	attr_reader :data
	
	def initialize(data)
		@data = data
	end

	def display
		output
	end

	private

		def output
			txt = HEADER
			@data.each do |x|
				txt += x.to_s
			end
			txt
		end

end